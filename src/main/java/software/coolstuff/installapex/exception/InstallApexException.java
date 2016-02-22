package software.coolstuff.installapex.exception;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.MessageSource;

public class InstallApexException extends RuntimeException {

  private static final long serialVersionUID = 6692580148429410706L;

  private static final Logger log = LoggerFactory.getLogger(InstallApexException.class);

  public static final int EXIT_STATUS_SUCCESS = 0;
  public static final int EXIT_STATUS_FAILURE = 1;

  private static final String PROPERTY_ALWAYS_PRINT_STACK_TRACE = "installApex.alwaysPrintStackTrace";

  private static final String PREFIX = "installApexException.";
  private static final String REASON_PREFIX = "reason.";
  private static final String MESSAGE = "message";

  private Reason reason;
  private transient List<Object> arguments = new ArrayList<>();
  private boolean printStackTrace = false;
  private int exitStatus = EXIT_STATUS_FAILURE;

  public InstallApexException(Reason reason, Object... arguments) {
    this(reason, (Throwable) null, arguments);
  }

  public InstallApexException(Reason reason, Throwable cause, Object... arguments) {
    super(reason.getMessageKey(), cause);
    this.reason = reason;
    printStackTrace = reason.isPrintStackTrace();
    exitStatus = reason.getExitStatus();
    this.arguments.addAll(Arrays.asList(arguments));
    log.error(String.format("%s occured with Reason: %s - StackTrace below", InstallApexException.class.getSimpleName(),
        reason), this);
  }

  public Reason getReason() {
    return reason;
  }

  public InstallApexException setPrintStrackTrace(boolean printStackTrace) {
    this.printStackTrace = printStackTrace;
    return this;
  }

  public int getExitStatus() {
    return exitStatus;
  }

  public InstallApexException setExitStatus(int exitStatus) {
    this.exitStatus = exitStatus;
    return this;
  }

  public boolean isPrintStackTrace() {
    Properties systemProperties = System.getProperties();
    if (systemProperties.containsKey(PROPERTY_ALWAYS_PRINT_STACK_TRACE)) {
      return true;
    }
    return printStackTrace;
  }

  public String getMessage(MessageSource messageSource, Locale locale) {
    String message = messageSource.getMessage(super.getMessage(), arguments.toArray(), locale);
    return messageSource.getMessage(PREFIX + MESSAGE, new Object[] { reason.getCode(), message }, locale);
  }

  public static enum Reason {

    UNKNOWN(99999, "unknown", true),

    CLI_ARGUMENT_NO_DIRECTORY(1, "noDirectoryByCLIArgument"),
    CLI_ENV_VARIABLE_NO_DIRECTORY(1, "noDirectoryBySystemPropertyOrEnvironmentVariable"),
    CLI_MISSING_REQUIRED_OPTION(2, "missingRequiredCommandLineOption"),
    CLI_OPTION_EVALUATION_ERROR(3, "cliOptionEvaluationError"),
    CREATE_DIRECTORY_ERROR(4, "createDirectoryError"),
    CREATE_FILE_ERROR(5, "createFileError"),
    CREATE_DATASOURCE_ERROR(6, "createDataSourceError"),
    CLI_ARGUMENT_NO_FILE(7, "fileNotFoundByOption"),
    CLI_ENV_VARIABLE_NO_FILE(7, "fileNotFoundBySystemPropertyOrEnvironmentVariable"),
    CLI_ARGUMENT_FILE_WITHOUT_EXECUTION_PRIVS(8, "fileWithoutExecutionPrivilegeByOption"),
    CLI_ENV_VARIABLE_FILE_WITHOUT_EXECUTION_PRIVS(8,
        "fileWithoutExecutionPrivilegeBySystemPropertyOrEnvironmentVariable"),
    APEX_ID_NOT_NUMERIC(9, "apexIdNotNumeric"),
    NO_APEX_DIRECTORY_INCLUDED(10, "noApexDirectoryIncluded"),
    ERROR_ON_APEX_DIRECTORY_ACCESS(11, "errorOnApexDirectoryAccess"),
    NO_APEX_APPLICATIONS_INCLUDED(12, "noApexApplicationsIncluded"),
    APEX_PARSER_EXCEPTION(13, "apexParserException", true),
    WRONG_INTERNAL_APEX_ID(14, "wrongInternalApexId"),
    CONSOLE_PROBLEM(15, "consoleProblem", true),
    UPGRADE_ERROR(16, "upgradeError", true),
    NO_APEX_INSTALLED(17, "noApexInstalled", false),
    NO_WORKSPACE_ASSIGNED(18, "noWorkspaceAssigned", false),
    REQUESTED_WORKSPACE_NOT_ASSIGNED(19, "requestedWorkspaceNotAssigned", false),
    REQUESTED_APEX_ID_NOT_AVAILABLE(20, "requestedApexIdNotAvailable", false),
    EXISTING_OUTPUT_IS_DIRECTORY(21, "exitingOutputIsDirectory", false),
    EXISTING_OUTPUT_IS_FILE(21, "existingOutputIsFile", false),
    CANNOT_OVERWRITE_OUTPUT_FILE_WITHOUT_FORCE_FLAG(22, "cannotOverwriteOutputFileWithoutForceFlag", false),
    CANNOT_OVERWRITE_OUTPUT_DIRECTORY_WITHOUT_FORCE_FLAG(22, "cannotOverwriteOutputDirectoryWithoutForceFlag", false),
    CANNOT_QUIETLY_READ_PASSWORD_FROM_CONSOLE(23, "cannotQuietlyReadPasswordFromConsole", false),
    ERROR_WHILE_INSTALL_WITH_SQLPLUS(24, "errorWhileInstallApplicationWithSQLPlus", true),
    NO_APEX_INSTALLATION_SCRIPT_AVAILABLE(25, "noApexInstallationScriptAvailable", false),
    INTERRUPTED_BY_USER(26, "interruptedByUser", false),
    INVALID_ERROR_CODE_BY_SQLPLUS(27, "invalidErrorCodeBySQLPlus", false);

    private int code;
    private String messageKey;
    private boolean printStackTrace;
    private int exitStatus;

    private Reason(int code, String messageKey) {
      this(code, messageKey, false, EXIT_STATUS_FAILURE);
    }

    private Reason(int code, String messageKey, boolean printStackTrace) {
      this(code, messageKey, printStackTrace, EXIT_STATUS_FAILURE);
    }

    private Reason(int code, String messageKey, int exitStatus) {
      this(code, messageKey, false, exitStatus);
    }

    private Reason(int code, String messageKey, boolean printStackTrace, int exitStatus) {
      this.code = code;
      this.messageKey = messageKey;
      this.printStackTrace = printStackTrace;
      this.exitStatus = exitStatus;
    }

    public int getCode() {
      return code;
    }

    public String getMessageKey() {
      return PREFIX + REASON_PREFIX + messageKey;
    }

    public boolean isPrintStackTrace() {
      return printStackTrace;
    }

    public int getExitStatus() {
      return exitStatus;
    }

  }

}

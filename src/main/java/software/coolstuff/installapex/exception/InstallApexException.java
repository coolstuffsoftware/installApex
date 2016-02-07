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
  private List<Object> arguments = new ArrayList<>();
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
    CREATE_DATASOURCE_ERROR(5, "createDataSourceError"),
    CLI_ARGUMENT_NO_FILE(6, "fileNotFoundByOption"),
    CLI_ENV_VARIABLE_NO_FILE(6, "fileNotFoundBySystemPropertyOrEnvironmentVariable"),
    CLI_ARGUMENT_FILE_WITHOUT_EXECUTION_PRIVS(7, "fileWithoutExecutionPrivilegeByOption"),
    CLI_ENV_VARIABLE_FILE_WITHOUT_EXECUTION_PRIVS(7,
        "fileWithoutExecutionPrivilegeBySystemPropertyOrEnvironmentVariable"),
    APEX_ID_NOT_NUMERIC(8, "apexIdNotNumeric"),
    NO_APEX_DIRECTORY_INCLUDED(9, "noApexDirectoryIncluded"),
    ERROR_ON_APEX_DIRECTORY_ACCESS(10, "errorOnApexDirectoryAccess"),
    NO_APEX_APPLICATIONS_INCLUDED(11, "noApexApplicationsIncluded"),
    APEX_PARSER_EXCEPTION(12, "apexParserException", true),
    WRONG_INTERNAL_APEX_ID(13, "wrongInternalApexId"),
    CONSOLE_PROBLEM(14, "consoleProblem", true),
    UPGRADE_ERROR(15, "upgradeError", true);

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

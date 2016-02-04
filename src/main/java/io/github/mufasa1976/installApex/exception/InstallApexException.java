package io.github.mufasa1976.installApex.exception;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import org.springframework.context.MessageSource;

public class InstallApexException extends RuntimeException {

  private static final long serialVersionUID = 6692580148429410706L;

  public static final int EXIT_STATUS_SUCCESS = 0;
  public static final int EXIT_STATUS_FAILURE = 1;

  private static final String PREFIX = "installApexException.";
  private static final String REASON_PREFIX = "reason.";
  private static final String MESSAGE = "message";

  private Reason reason;
  private List<Object> arguments = new ArrayList<>();
  private boolean printStackTrace = true;
  private int exitStatus = EXIT_STATUS_FAILURE;

  public InstallApexException(Reason reason, Object... arguments) {
    this(reason, (Throwable) null, arguments);
  }

  public InstallApexException(Reason reason, Throwable cause, Object... arguments) {
    super(reason.getMessageKey(), cause);
    this.reason = reason;
    this.arguments.addAll(Arrays.asList(arguments));
  }

  public InstallApexException setPrintStrackTrace(boolean printStackTrace) {
    this.printStackTrace = printStackTrace;
    return this;
  }

  public InstallApexException setExitStatus(int exitStatus) {
    this.exitStatus = exitStatus;
    return this;
  }

  public Reason getReason() {
    return reason;
  }

  public boolean isPrintStackTrace() {
    return printStackTrace;
  }

  protected List<Object> getArguments() {
    return arguments;
  }

  public int getExitStatus() {
    return exitStatus;
  }

  public String getMessage(MessageSource messageSource, Locale locale) {
    String message = messageSource.getMessage(reason.getMessageKey(), arguments.toArray(), locale);
    return messageSource.getMessage(PREFIX + MESSAGE, new Object[] { reason.getCode(), message }, locale);
  }

  public static enum Reason {

    UNKNOWN(99999, "unknown"),

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
        "fileWithoutExecutionPrivilegeBySystemPrivilegeOrEnvironmentVariable"),
    APEX_ID_NOT_NUMERIC(8, "apexIdNotNumeric"),
    NO_APEX_DIRECTORY_INCLUDED(9, "noApexDirectoryIncluded"),
    ERROR_ON_APEX_DIRECTORY_ACCESS(10, "errorOnApexDirectoryAccess"),
    NO_APEX_APPLICATIONS_INCLUDED(11, "noApexApplicationsIncluded"),
    APEX_PARSER_EXCEPTION(12, "apexParserException"),
    WRONG_INTERNAL_APEX_ID(13, "wrongInternalApexId");

    private int code;
    private String messageKey;

    private Reason(int code, String messageKey) {
      this.code = code;
      this.messageKey = messageKey;
    }

    public int getCode() {
      return code;
    }

    public String getMessageKey() {
      return PREFIX + REASON_PREFIX + messageKey;
    }

  }

}

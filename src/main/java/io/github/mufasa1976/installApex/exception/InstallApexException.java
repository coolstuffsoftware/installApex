package io.github.mufasa1976.installApex.exception;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import org.springframework.context.MessageSource;

public abstract class InstallApexException extends RuntimeException {

  private static final long serialVersionUID = 6692580148429410706L;

  public static final int EXIT_STATUS_SUCCESS = 0;
  public static final int EXIT_STATUS_FAILURE = 1;

  private List<Object> arguments = new ArrayList<>();
  private boolean printStackTrace = true;
  private int exitStatus = EXIT_STATUS_FAILURE;

  public InstallApexException(String messageKey, Object... arguments) {
    super(messageKey);
    this.arguments.addAll(Arrays.asList(arguments));
  }

  public InstallApexException(String messageKey, Throwable cause, Object... arguments) {
    super(messageKey, cause);
    this.arguments.addAll(Arrays.asList(arguments));
  }

  protected List<Object> getArguments() {
    return arguments;
  }

  protected void setPrintStackTrace(boolean printStackTrace) {
    this.printStackTrace = printStackTrace;
  }

  public boolean isPrintStackTrace() {
    return printStackTrace;
  }

  protected void setExitStatus(int exitStatus) {
    this.exitStatus = exitStatus;
  }

  public int getExitStatus() {
    return exitStatus;
  }

  public String getMessage(MessageSource messageSource, Locale locale) {
    return messageSource.getMessage(super.getMessage(), arguments.toArray(), locale);
  }

}

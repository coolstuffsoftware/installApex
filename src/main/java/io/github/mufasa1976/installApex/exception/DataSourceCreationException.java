package io.github.mufasa1976.installApex.exception;

public class DataSourceCreationException extends InstallApexException {

  private static final long serialVersionUID = 976409711277693507L;

  private static final String MESSAGE_KEY = "dataSourceCreationException";

  public DataSourceCreationException(String tns, String user, Throwable cause) {
    super(MESSAGE_KEY, cause, tns, user, cause.getMessage());
    setPrintStackTrace(true);
  }

}

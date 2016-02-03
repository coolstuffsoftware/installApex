package io.github.mufasa1976.installApex.exception;

public class ConnectionCreationException extends InstallApexException {

  private static final long serialVersionUID = 5071573603700923593L;

  private static final String MESSAGE_KEY = "connectionCreationException";

  public ConnectionCreationException(Throwable e) {
    super(MESSAGE_KEY, e);
  }

}

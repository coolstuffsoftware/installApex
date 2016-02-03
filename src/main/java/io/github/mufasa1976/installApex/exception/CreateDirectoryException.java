package io.github.mufasa1976.installApex.exception;

import java.nio.file.Path;

import io.github.mufasa1976.installApex.cli.CommandLineOption;

public class CreateDirectoryException extends InstallApexException {

  private static final long serialVersionUID = 386439395968870097L;

  private static final String MESSAGE_KEY = "createDirectoryException";

  public CreateDirectoryException(Throwable cause, CommandLineOption option, Path directory) {
    super(MESSAGE_KEY, cause, option, directory.toAbsolutePath(), cause != null ? cause.getMessage() : null);
    setPrintStackTrace(true);
  }

}

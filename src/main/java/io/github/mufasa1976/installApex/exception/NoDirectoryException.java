package io.github.mufasa1976.installApex.exception;

import java.nio.file.Path;

import io.github.mufasa1976.installApex.cli.CommandLineOption;

public class NoDirectoryException extends InstallApexException {

  private static final long serialVersionUID = 6873019481566298876L;

  private static final String MESSAGE_KEY_COMMANDLINE_OPTION = "noDirectoryException.commandLineOption";
  private static final String MESSAGE_KEY_SYSTEM_PROPERTY = "noDirectoryException.systemPropertyKeyOrEnvironmentVariable";

  public NoDirectoryException(Path location, CommandLineOption commandLineOption) {
    super(MESSAGE_KEY_COMMANDLINE_OPTION, location.toAbsolutePath(), commandLineOption.getLongOption());
  }

  public NoDirectoryException(Path location, String systemPropertyKeyOrEnvironmentVariable) {
    super(MESSAGE_KEY_SYSTEM_PROPERTY, location.toAbsolutePath(), systemPropertyKeyOrEnvironmentVariable);
  }

}

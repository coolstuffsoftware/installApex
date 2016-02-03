package io.github.mufasa1976.installApex.exception;

import io.github.mufasa1976.installApex.cli.CommandLineOption;
import io.github.mufasa1976.installApex.command.CommandType;

public class EmptyCommandLineOptionException extends InstallApexException {

  private static final long serialVersionUID = -7599800004047591195L;

  private static final String MISSING_OPTION_WITHOUT_FALLBACK = "emptyCommandLineOptionException.withoutFallback";
  private static final String MISSING_OPTION_WITH_ENVIRONMENT_VARIABLE = "emptyCommandLineOptionException.withEnvironmentVariableOrSystemProperty";

  public EmptyCommandLineOptionException(CommandLineOption option, CommandType commandType) {
    super(MISSING_OPTION_WITHOUT_FALLBACK, option.getLongOption(), commandType.getLongOption());
  }

  public EmptyCommandLineOptionException(CommandLineOption option, String systemPropertyKey, CommandType commandType) {
    super(MISSING_OPTION_WITH_ENVIRONMENT_VARIABLE, option.getLongOption(), commandType.getLongOption(),
        systemPropertyKey);
  }

}

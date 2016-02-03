package io.github.mufasa1976.installApex.exception;

import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.context.MessageSource;

import io.github.mufasa1976.installApex.cli.CommandLineOption;

public class NoExecutableFileException extends InstallApexException {

  private static final long serialVersionUID = 8208873456733968144L;

  private static final String COMMAND_LINE_OPTION = "noExecutableFileException.byCommandLineOption";
  private static final String ENVIRONMENT_VARIABLE = "noExecutableFileException.byEnvironmentVariable";

  private Reason reason;
  private Path location;

  public NoExecutableFileException(Path location, CommandLineOption option, Reason reason) {
    super(COMMAND_LINE_OPTION, option.getLongOption());
    this.location = location;
    this.reason = reason;
  }

  public NoExecutableFileException(Path location, String environmentVariable, Reason reason) {
    super(ENVIRONMENT_VARIABLE, environmentVariable);
    this.location = location;
    this.reason = reason;
  }

  @Override
  public String getMessage(MessageSource messageSource, Locale locale) {
    List<Object> arguments = new ArrayList<>(getArguments());
    if (reason != null) {
      arguments
          .add(messageSource.getMessage(reason.getMessageKey(), new Object[] { location.toAbsolutePath() }, locale));
    }
    return messageSource.getMessage(super.getMessage(), arguments.toArray(), locale);
  }

  public static enum Reason {

    NO_FILE("noExecutableFileException.reason.noFile"),
    NO_EXEC_PRIVS("noExecutableFileException.reason.noExecPrivs");

    private final String messageKey;

    private Reason(String messageKey) {
      this.messageKey = messageKey;
    }

    public String getMessageKey() {
      return messageKey;
    }

  }

}

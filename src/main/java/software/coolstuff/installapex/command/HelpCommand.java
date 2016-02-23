package software.coolstuff.installapex.command;

import java.util.Locale;

import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Options;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import software.coolstuff.installapex.InstallApex;
import software.coolstuff.installapex.cli.CommandLineOption;
import software.coolstuff.installapex.cli.CommandLineUtils;

@Service
public class HelpCommand extends AbstractCommand {

  private static final String HELP_HEADER_PREFIX = "helpCommand.header.";
  private static final String HELP_FOOTER_PREFIX = "helpCommand.footer.";
  private static final String HELP_EXAMPLES_PREFIX = "helpCommand.examples.";

  private static final String EMPTY_MESSAGE = "!#{emptyMessage}#!";
  private static final String NEW_LINE = "\n";

  @Autowired
  private HelpFormatter helpFormatter;

  @Autowired
  private MessageSource messageSource;

  @Value("${applicationConfiguration.leftPadding}")
  private int leftPadding;

  @Value("${applicationConfiguration.descPadding}")
  private int descPadding;

  @Override
  public void execute() {
    String syntax = CommandLineUtils.getSyntax(InstallApex.class);

    String header = getMultiLineHelpMessage(HELP_HEADER_PREFIX, syntax);
    String footer = getMultiLineHelpMessage(HELP_FOOTER_PREFIX, syntax);

    Options options = CommandLineOption.getOptions(messageSource, Locale.getDefault());
    helpFormatter.printHelp(getPrintWriter(), getTerminalWidth(), syntax, header, options, leftPadding, descPadding,
        footer, true);

    String examples = getMultiLineHelpMessage(HELP_EXAMPLES_PREFIX, syntax);
    println(examples);
  }

  @Override
  protected CommandType getCommandType() {
    return CommandType.HELP;
  }

  private String getMultiLineHelpMessage(String messagePrefix, String syntax) {
    StringBuilder messages = new StringBuilder();
    String message = null;
    String[] args = new String[] { syntax };
    int line = 1;
    do {
      String messageKey = messagePrefix + line;
      message = messageSource.getMessage(messageKey, args, EMPTY_MESSAGE, Locale.getDefault());
      appendMessage(messages, message, line);
      line++;
    } while (!EMPTY_MESSAGE.equals(message));
    return messages.toString();
  }

  private void appendMessage(StringBuilder messages, String message, int line) {
    if (!EMPTY_MESSAGE.equals(message)) {
      appendNewLine(messages, line);
      messages.append(message);
    }
  }

  private void appendNewLine(StringBuilder messages, int i) {
    if (i > 1) {
      messages.append(NEW_LINE);
    }
  }

}

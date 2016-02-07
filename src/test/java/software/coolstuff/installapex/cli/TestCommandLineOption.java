package software.coolstuff.installapex.cli;

import static org.testng.Assert.assertNotEquals;
import static org.testng.Assert.assertNotNull;
import static org.testng.Assert.assertTrue;

import java.util.Locale;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.MissingArgumentException;
import org.apache.commons.cli.MissingOptionException;
import org.apache.commons.cli.ParseException;
import org.apache.commons.cli.UnrecognizedOptionException;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.testng.annotations.Test;

import software.coolstuff.installapex.AbstractInstallApexTestWithContext;
import software.coolstuff.installapex.cli.CommandLineOption;

public class TestCommandLineOption extends AbstractInstallApexTestWithContext {

  @Autowired
  private CommandLineParser parser;

  @Autowired
  private MessageSource messageSource;

  @Test
  public void testOK() throws ParseException {
    parse(CommandLineOption.LIST.getLongOption("--"));
  }

  private CommandLine parse(String... args) throws ParseException {
    return parser.parse(CommandLineOption.getOptions(messageSource), args);
  }

  @Test(expectedExceptions = MissingOptionException.class)
  public void testNullAsArguments() throws ParseException {
    parse((String[]) null);
  }

  @Test(expectedExceptions = MissingOptionException.class)
  public void testNoArguments() throws ParseException {
    parse(new String[] {});
  }

  @Test(expectedExceptions = UnrecognizedOptionException.class)
  public void testWrongOption() throws ParseException {
    parse("--wrongOption");
  }

  @Test(expectedExceptions = MissingOptionException.class)
  public void testMissingCommand() throws ParseException {
    parse(CommandLineOption.TEMP_DIRECTORY.getLongOption("--"), "directory");
  }

  @Test
  public void testOptionWithArgument() throws ParseException {
    parse(CommandLineOption.EXTRACT_DDL.getLongOption("--"), CommandLineOption.TEMP_DIRECTORY.getLongOption("--"),
        "directory");
  }

  @Test(expectedExceptions = MissingArgumentException.class)
  public void testArgumentOptionWithoutArgument() throws ParseException {
    parse(CommandLineOption.EXTRACT_DDL.getLongOption("--"), CommandLineOption.TEMP_DIRECTORY.getLongOption("--"));
  }

  @Test
  public void testMessageDescriptionExists() {
    final String PREFIX = "commandLineOption.option.";
    for (CommandLineOption option : CommandLineOption.values()) {
      String messageKey = PREFIX + option.getLongOption();
      String message = messageSource.getMessage(messageKey, null, Locale.getDefault());
      assertTrue(StringUtils.isNotBlank(message));
      assertNotNull(message);
      assertNotEquals(messageKey, message, "No Message defined for Key " + messageKey);
    }
  }
}

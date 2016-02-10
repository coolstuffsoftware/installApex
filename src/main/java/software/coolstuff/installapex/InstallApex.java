package software.coolstuff.installapex;

import java.util.Locale;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Component;

import software.coolstuff.installapex.cli.CommandLineOption;
import software.coolstuff.installapex.command.Command;
import software.coolstuff.installapex.command.CommandRegistry;
import software.coolstuff.installapex.config.ApplicationConfiguration;
import software.coolstuff.installapex.exception.InstallApexException;

@Component
public class InstallApex {

  private static final Logger log = LoggerFactory.getLogger(InstallApex.class);

  private final static int EXIT_STATUS_SUCCESS = 0;
  private final static int EXIT_STATUS_ERROR = 1;

  @Autowired
  private MessageSource messageSource;

  private CommandLineParser commandLineParser;

  @Autowired
  private CommandRegistry commandRegistry;

  public static void main(String[] args) {
    log.debug("Initialize the Application Context");
    ConfigurableApplicationContext context = null;
    try {
      context = new AnnotationConfigApplicationContext(ApplicationConfiguration.class);
      log.debug("Get the main Bean and execute");
      InstallApex main = context.getBean(InstallApex.class);
      System.exit(main.execute(args));
    } finally {
      if (context != null) {
        context.close();
      }
    }

  }

  public int execute(String[] args) {
    try {
      process(preventEmptyArgs(args));
      return EXIT_STATUS_SUCCESS;
    } catch (ParseException e) {
      return printErrorAndUsage(e);
    } catch (InstallApexException e) {
      System.err.println(e.getMessage(messageSource, Locale.getDefault()));
      if (e.isPrintStackTrace()) {
        e.printStackTrace(System.err);
      }
      return e.getExitStatus();
    }
  }

  private String[] preventEmptyArgs(String[] args) {
    if (emptyArgs(args)) {
      log.debug("No Arguments given --> just only show the Help (by executing the HelpCommand)");
      return new String[] { "--" + CommandLineOption.HELP.getLongOption() };
    }
    return args;
  }

  private boolean emptyArgs(String[] args) {
    return args == null || args.length == 0;
  }

  public void process(String[] args) throws ParseException {
    log.debug("parse the CommandLine");
    CommandLine commandLine = commandLineParser.parse(CommandLineOption.getOptions(messageSource), args);

    log.debug("Get the Command based on the CommandLine");
    Command command = commandRegistry.prepareCommandBy(commandLine);

    log.debug("Command {} found", command);
    command.execute();
  }

  private int printErrorAndUsage(Exception e) {
    System.err.println(e.getMessage());
    try {
      process(preventEmptyArgs(null));
    } catch (ParseException ignored) {}
    return EXIT_STATUS_ERROR;
  }

  @Autowired
  public void setCommandLineParser(CommandLineParser commandLineParser) {
    this.commandLineParser = commandLineParser;
  }

}

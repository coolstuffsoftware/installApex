package io.github.mufasa1976.installApex;

import java.util.Locale;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Component;

import io.github.mufasa1976.installApex.cli.CommandLineOption;
import io.github.mufasa1976.installApex.command.Command;
import io.github.mufasa1976.installApex.command.CommandRegistry;
import io.github.mufasa1976.installApex.config.ApplicationConfiguration;
import io.github.mufasa1976.installApex.exception.InstallApexException;

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
    @SuppressWarnings("resource")
    ApplicationContext context = new AnnotationConfigApplicationContext(ApplicationConfiguration.class);

    log.debug("Get the main Bean and execute");
    InstallApex main = context.getBean(InstallApex.class);
    System.exit(main.execute(args));
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

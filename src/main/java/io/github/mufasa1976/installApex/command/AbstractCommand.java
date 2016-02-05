package io.github.mufasa1976.installApex.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

import javax.annotation.PostConstruct;

import org.apache.commons.cli.CommandLine;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

import io.github.mufasa1976.installApex.command.settings.CommandLineCommandSettingsAdapter;
import io.github.mufasa1976.installApex.command.settings.CommandSettings;
import io.github.mufasa1976.installApex.exception.InstallApexException;
import io.github.mufasa1976.installApex.exception.InstallApexException.Reason;
import jline.Terminal;
import jline.console.ConsoleReader;

public abstract class AbstractCommand implements Command {

  private static final Logger log = LoggerFactory.getLogger(AbstractCommand.class);

  @Autowired
  private CommandRegistryImpl commandRegistry;

  @Autowired
  private ResourceLoader resourceLoader;

  @Autowired
  private MessageSource messageSource;

  @Autowired
  private ConsoleReader consoleReader;

  private PrintWriter printWriter;

  private CommandSettings commandSettings;

  @PostConstruct
  protected void init() {
    commandRegistry.register(this);
    printWriter = new PrintWriter(consoleReader.getOutput());
  }

  protected abstract CommandType getCommandType();

  void prepareCommand(CommandLine commandLine) {
    log.debug("prepare the CommandSettings of Command {}", this);
    commandSettings = new CommandLineCommandSettingsAdapter(getCommandType(), commandLine);
  }

  protected CommandSettings getSettings() {
    return commandSettings;
  }

  protected Resource getResource(String location) {
    return resourceLoader.getResource(location);
  }

  protected void printMessage(String messageKey, Object... arguments) {
    String message = messageSource.getMessage(messageKey, arguments, Locale.getDefault());
    print(message);
  }

  protected void printlnMessage(String messageKey, Object... arguments) {
    String message = messageSource.getMessage(messageKey, arguments, Locale.getDefault());
    println(message);
  }

  protected void print(Object message) {
    try {
      consoleReader.print(message != null ? message.toString() : "null");
      consoleReader.flush();
    } catch (IOException e) {
      throw new InstallApexException(Reason.CONSOLE_PROBLEM, e).setPrintStrackTrace(true);
    }
  }

  protected void println(Object message) {
    try {
      consoleReader.println(message != null ? message.toString() : "null");
      consoleReader.flush();
    } catch (IOException e) {
      throw new InstallApexException(Reason.CONSOLE_PROBLEM, e).setPrintStrackTrace(true);
    }
  }

  protected int getTerminalWidth() {
    Terminal terminal = consoleReader.getTerminal();
    return terminal.getWidth();
  }

  protected int getTerminalHeight() {
    Terminal terminal = consoleReader.getTerminal();
    return terminal.getHeight();
  }

  protected PrintWriter getPrintWriter() {
    return printWriter;
  }

  @Override
  public String toString() {
    return this.getClass().getName() + " {commandType: \"" + getCommandType() + "\"}";
  }
}

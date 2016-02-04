package io.github.mufasa1976.installApex.command;

import io.github.mufasa1976.installApex.command.settings.CommandLineCommandSettingsAdapter;
import io.github.mufasa1976.installApex.command.settings.CommandSettings;
import io.github.mufasa1976.installApex.exception.InstallApexException;
import io.github.mufasa1976.installApex.exception.InstallApexException.Reason;

import java.io.IOException;
import java.util.Locale;

import javax.annotation.PostConstruct;

import jline.console.ConsoleReader;

import org.apache.commons.cli.CommandLine;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

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

  private CommandSettings commandSettings;

  @PostConstruct
  protected void init() {
    commandRegistry.register(this);
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

  protected void print(String message) {
    try {
      consoleReader.print(message);
    } catch (IOException e) {
      throw new InstallApexException(Reason.CONSOLE_PROBLEM, e).setPrintStrackTrace(true);
    }
  }

  @Override
  public String toString() {
    return this.getClass().getName() + " {commandType: \"" + getCommandType() + "\"}";
  }
}

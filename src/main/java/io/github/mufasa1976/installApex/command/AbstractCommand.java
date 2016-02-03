package io.github.mufasa1976.installApex.command;

import javax.annotation.PostConstruct;

import org.apache.commons.cli.CommandLine;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

import io.github.mufasa1976.installApex.command.settings.CommandLineCommandSettingsAdapter;
import io.github.mufasa1976.installApex.command.settings.CommandSettings;

public abstract class AbstractCommand implements Command {

  private static final Logger log = LoggerFactory.getLogger(AbstractCommand.class);

  @Autowired
  private CommandRegistryImpl commandRegistry;

  @Autowired
  private ResourceLoader resourceLoader;

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

  @Override
  public String toString() {
    return this.getClass().getName() + " {commandType: \"" + getCommandType() + "\"}";
  }
}

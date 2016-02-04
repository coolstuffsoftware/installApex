package io.github.mufasa1976.installApex.command;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.cli.CommandLine;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import io.github.mufasa1976.installApex.cli.CommandLineOption;

@Service
public class CommandRegistryImpl implements CommandRegistry {

  private static final Logger log = LoggerFactory.getLogger(CommandRegistryImpl.class);

  private Map<CommandType, AbstractCommand> commands = new HashMap<>();

  public void register(AbstractCommand command) {
    log.debug("Registering Command {}", command);
    commands.put(command.getCommandType(), command);
  }

  @Override
  public Command prepareCommandBy(CommandLine commandLine) {
    CommandType commandType = evaluateCommandType(commandLine);
    if (commandType == null) {
      log.warn("No CommandType found on the CommandLine");
      return null;
    }
    log.debug("CommandLine has discovered CommandType {}", commandType);

    AbstractCommand command = commands.get(commandType);
    checkCommandAvailability(command, commandType);
    command.prepareCommand(commandLine);
    return command;
  }

  private CommandType evaluateCommandType(CommandLine commandLine) {
    for (CommandLineOption option : CommandLineOption.getCommandOptions()) {
      if (option.isAvailableOn(commandLine)) {
        return option.getCommandType();
      }
    }
    return null;
  }

  private void checkCommandAvailability(AbstractCommand command, CommandType commandType) {
    if (command == null) {
      throw new IllegalStateException(String.format("No Implementation found for Command %s", commandType));
    }
  }

}
package software.coolstuff.installapex.command;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.cli.CommandLine;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import software.coolstuff.installapex.cli.CommandLineOption;
import software.coolstuff.installapex.command.settings.CommandLineCommandSettingsAdapter;
import software.coolstuff.installapex.command.settings.CommandSettings;

@Service
public class CommandRegistryImpl implements CommandRegistry {

  private static final Logger LOG = LoggerFactory.getLogger(CommandRegistryImpl.class);

  private Map<CommandType, AbstractCommand> commands = new HashMap<>();

  public void register(AbstractCommand command) {
    LOG.debug("Registering Command {}", command);
    commands.put(command.getCommandType(), command);
  }

  @Override
  public Command prepareCommandBy(CommandLine commandLine) {
    CommandType commandType = evaluateCommandType(commandLine);
    if (commandType == null) {
      LOG.warn("No CommandType found on the CommandLine");
      return null;
    }
    LOG.debug("CommandLine has discovered CommandType {}", commandType);

    AbstractCommand command = commands.get(commandType);
    checkCommandAvailability(command, commandType);

    LOG.debug("prepare the CommandSettings of Command {}", command);
    CommandSettings commandSettings = new CommandLineCommandSettingsAdapter(commandType, commandLine);
    command.setCommandSettings(commandSettings);

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

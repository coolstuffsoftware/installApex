package software.coolstuff.installapex.command;

import org.apache.commons.cli.CommandLine;

public interface CommandRegistry {

  Command prepareCommandBy(CommandLine commandLine);

}

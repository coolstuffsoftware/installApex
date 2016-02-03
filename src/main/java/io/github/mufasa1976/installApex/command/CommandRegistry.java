package io.github.mufasa1976.installApex.command;

import org.apache.commons.cli.CommandLine;

public interface CommandRegistry {

  Command prepareCommandBy(CommandLine commandLine);

}

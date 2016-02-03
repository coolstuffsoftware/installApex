package io.github.mufasa1976.installApex.command.database;

import io.github.mufasa1976.installApex.command.CommandType;

import javax.naming.OperationNotSupportedException;

public class TestCommand extends AbstractDataSourceCommand {

  @Override
  public void execute() throws OperationNotSupportedException {
    throw new OperationNotSupportedException();
  }

  @Override
  protected CommandType getCommandType() {
    return CommandType.TEST;
  }

}

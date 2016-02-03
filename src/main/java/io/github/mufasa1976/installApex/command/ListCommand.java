package io.github.mufasa1976.installApex.command;

import javax.naming.OperationNotSupportedException;

public class ListCommand extends AbstractCommand {

  @Override
  public void execute() throws OperationNotSupportedException {
    throw new OperationNotSupportedException();
  }

  @Override
  protected CommandType getCommandType() {
    return CommandType.LIST;
  }

}

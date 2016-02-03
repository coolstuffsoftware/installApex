package io.github.mufasa1976.installApex.command;

import javax.naming.OperationNotSupportedException;

public interface Command {

  void execute() throws OperationNotSupportedException;

}

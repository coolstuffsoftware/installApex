package software.coolstuff.installapex.command;

import javax.naming.OperationNotSupportedException;

public interface Command {

  void execute() throws OperationNotSupportedException;

}

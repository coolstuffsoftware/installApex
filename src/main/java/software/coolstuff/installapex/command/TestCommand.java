package software.coolstuff.installapex.command;

import javax.naming.OperationNotSupportedException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import software.coolstuff.installapex.service.upgrade.UpgradeService;

@Service
public class TestCommand extends AbstractCommand {

  @Autowired
  private UpgradeService liquibaseService;

  @Override
  public void execute() throws OperationNotSupportedException {
    String password = readDatabasePasswordFromConsole();
    println("Password: " + password);
    // throw new OperationNotSupportedException();
  }

  @Override
  protected CommandType getCommandType() {
    return CommandType.TEST;
  }

}

package software.coolstuff.installapex.command;

import java.util.Map;

import javax.naming.OperationNotSupportedException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import software.coolstuff.installapex.exception.InstallApexException;
import software.coolstuff.installapex.exception.InstallApexException.Reason;
import software.coolstuff.installapex.service.apex.ApexParameter;
import software.coolstuff.installapex.service.database.ApexDatabaseCheckService;
import software.coolstuff.installapex.service.upgrade.UpgradeService;

@Service
public class TestCommand extends AbstractDataSourceCommand {

  @Autowired
  private UpgradeService upgradeService;

  @Autowired
  private ApexDatabaseCheckService apexDatabaseCheckService;

  @Override
  protected void executeWithInitializedDataSource() throws OperationNotSupportedException {
    String apexVersion = apexDatabaseCheckService.getApexVersion();
    ApexParameter apexParameter = getSettings().getApexParameter();
    Map<String, Integer> apexWorkspaces = apexDatabaseCheckService.getApexWorkspacesFor(apexParameter.getSchema());
    if (apexWorkspaces.isEmpty()) {
      throw new InstallApexException(Reason.NO_WORKSPACE_ASSIGNED, apexParameter.getSchema().toUpperCase());
    }
  }

  @Override
  protected CommandType getCommandType() {
    return CommandType.TEST;
  }

}

package software.coolstuff.installapex.command;

import java.util.Map;

import javax.naming.OperationNotSupportedException;

import org.apache.commons.collections.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import software.coolstuff.installapex.cli.CommandLineOption;
import software.coolstuff.installapex.exception.InstallApexException;
import software.coolstuff.installapex.exception.InstallApexException.Reason;
import software.coolstuff.installapex.service.apex.ApexParameter;
import software.coolstuff.installapex.service.database.ApexDatabaseCheckService;
import software.coolstuff.installapex.service.upgrade.UpgradeService;

@Service
public class TestCommand extends AbstractDataSourceCommand {

  private static final String KEY_SHOW_APEX_VERSION = "testCommand.showApexVersion";

  @Autowired
  private UpgradeService upgradeService;

  @Autowired
  private ApexDatabaseCheckService apexDatabaseCheckService;

  @Override
  protected void executeWithInitializedDataSource() throws OperationNotSupportedException {
    String apexVersion = apexDatabaseCheckService.getApexVersion();
    printlnMessage(KEY_SHOW_APEX_VERSION, apexVersion);
    ApexParameter apexParameter = getSettings().getApexParameter();
    Map<String, Long> apexWorkspaces = apexDatabaseCheckService.getApexWorkspacesFor(apexParameter.getSchema());
    if (MapUtils.isEmpty(apexWorkspaces)) {
      throw new InstallApexException(Reason.NO_WORKSPACE_ASSIGNED, apexParameter.getSchema().toUpperCase());
    }
    if (apexParameter.isWorkspaceNotEmpty()) {
      if (!apexWorkspaces.containsKey(apexParameter.getWorkspace().toUpperCase())) {
        throw new InstallApexException(Reason.REQUESTED_WORKSPACE_NOT_ASSIGNED,
            apexParameter.getWorkspace().toUpperCase(), apexParameter.getSchema().toUpperCase());
      }
    } else if (apexWorkspaces.size() > 2) {
      throw new InstallApexException(Reason.CLI_MISSING_REQUIRED_OPTION,
          CommandLineOption.APEX_TARGET_WORKSPACE.getLongOption("--"), getCommandType().getLongOption("--"));
    }
  }

  @Override
  protected CommandType getCommandType() {
    return CommandType.TEST;
  }

}

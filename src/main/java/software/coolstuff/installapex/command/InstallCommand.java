package software.coolstuff.installapex.command;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import software.coolstuff.installapex.service.apex.parser.ApexApplication;
import software.coolstuff.installapex.service.database.DatabaseCheckService;
import software.coolstuff.installapex.service.upgrade.UpgradeParameter;
import software.coolstuff.installapex.service.upgrade.UpgradeService;

@Service
public class InstallCommand extends AbstractDataSourceCommand {

  private static final String KEY_SHOW_APEX_VERSION = "installCommand.showApexVersion";
  private static final String KEY_INSTALL_APEX_APPLICAITON = "installCommand.installApexApplication";
  private static final String KEY_UPGRADE_DATABASE = "installCommand.upgradeDatabase";

  @Autowired
  private UpgradeService upgradeService;

  @Autowired
  private DatabaseCheckService databaseCheckService;

  @Override
  protected void executeWithInitializedDataSource() {
    String apexVersion = databaseCheckService.getApexVersion();
    printlnMessage(KEY_SHOW_APEX_VERSION, apexVersion);

    ApexApplication apexApplication = getInstallationCandidate(true);
    printlnMessage(KEY_INSTALL_APEX_APPLICAITON, apexApplication.getName(), apexApplication.getId(),
        apexApplication.getVersion());

    upgradeDatabase(apexApplication);
  }

  private void upgradeDatabase(ApexApplication apexApplication) {
    printlnMessage(KEY_UPGRADE_DATABASE, getSettings().getSQLPlusConnect(), apexApplication.getId());
    UpgradeParameter upgradeParameter = getSettings().getUpgradeParameter();
    upgradeParameter.setApexApplication(apexApplication.getId());
    upgradeService.updateDatabase(upgradeParameter);
  }

  @Override
  protected CommandType getCommandType() {
    return CommandType.INSTALL;
  }

}

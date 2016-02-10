package software.coolstuff.installapex.command;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import software.coolstuff.installapex.cli.CommandLineOption;
import software.coolstuff.installapex.exception.InstallApexException;
import software.coolstuff.installapex.exception.InstallApexException.Reason;
import software.coolstuff.installapex.service.apex.ApexParameter;
import software.coolstuff.installapex.service.apex.parser.ApexApplication;
import software.coolstuff.installapex.service.apex.parser.ApexApplicationParserService;
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
  private ApexApplicationParserService apexApplicationParserService;

  @Autowired
  private DatabaseCheckService databaseCheckService;

  @Value("${apexApplicationParserService.apexResourceLocation}")
  private String defaultLocation;

  @Override
  protected void executeWithInitializedDataSource() {
    String apexVersion = databaseCheckService.getApexVersion();
    printlnMessage(KEY_SHOW_APEX_VERSION, apexVersion);

    ApexApplication apexApplication = getInstallationCandidate();
    printlnMessage(KEY_INSTALL_APEX_APPLICAITON, apexApplication.getName(), apexApplication.getId(),
        apexApplication.getVersion());

    upgradeDatabase(apexApplication);
  }

  private ApexApplication getInstallationCandidate() {
    List<ApexApplication> candidates = apexApplicationParserService.getCandidates();
    if (CollectionUtils.isEmpty(candidates)) {
      throw new InstallApexException(Reason.NO_APEX_APPLICATIONS_INCLUDED, defaultLocation);
    }
    ApexParameter apexParameter = getSettings().getApexParameter();
    Integer requestedApplicationId = apexParameter.getSourceId();
    if (requestedApplicationId == null) {
      return getSingleApexApplication(candidates);
    }
    return findCandidate(candidates, requestedApplicationId);
  }

  private ApexApplication getSingleApexApplication(List<ApexApplication> candidates) {
    if (candidates.size() == 1) {
      return candidates.get(0);
    }
    throw new InstallApexException(Reason.CLI_MISSING_REQUIRED_OPTION,
        CommandLineOption.APEX_SOURCE_ID.getLongOption("--"), getCommandType().getLongOption("--"));
  }

  private ApexApplication findCandidate(List<ApexApplication> candidates, Integer requestedApplicationId) {
    for (ApexApplication candidate : candidates) {
      if (candidate.getId() == requestedApplicationId) {
        return candidate;
      }
    }
    throw new InstallApexException(Reason.REQUESTED_APEX_ID_NOT_AVAILABLE, requestedApplicationId);
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

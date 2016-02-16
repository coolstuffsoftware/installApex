package software.coolstuff.installapex.command;

import java.io.Writer;

import jline.console.ConsoleReader;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import software.coolstuff.installapex.service.apex.parser.ApexApplication;
import software.coolstuff.installapex.service.upgrade.UpgradeParameter;
import software.coolstuff.installapex.service.upgrade.UpgradeService;

@Service
public class ExtractDDLCommand extends AbstractDataSourceCommand {

  @Autowired
  private UpgradeService upgradeService;

  @Autowired
  @Qualifier("error")
  private ConsoleReader errorConsole;

  @Override
  protected void executeWithInitializedDataSource() {
    ApexApplication candidate = getInstallationCandidate(false);
    UpgradeParameter upgradeParameter = getSettings().getUpgradeParameter();
    upgradeParameter.setApexApplication(candidate.getId());
    Writer outputWriter = getSettings().getOutputFile(getPrintWriter());
    upgradeService.extractDDL(upgradeParameter, outputWriter);
  }

  @Override
  protected ConsoleReader getInputConsole() {
    if (getSettings().isOutputToConsole()) {
      return errorConsole;
    }
    return super.getInputConsole();
  }

  @Override
  protected CommandType getCommandType() {
    return CommandType.EXTRACT_DDL;
  }

}

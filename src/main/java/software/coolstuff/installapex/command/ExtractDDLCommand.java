package software.coolstuff.installapex.command;

import java.io.Writer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import software.coolstuff.installapex.service.upgrade.UpgradeParameter;
import software.coolstuff.installapex.service.upgrade.UpgradeService;

@Service
public class ExtractDDLCommand extends AbstractDataSourceCommand {

  @Autowired
  private UpgradeService upgradeService;

  @Override
  protected void executeWithInitializedDataSource() {
    UpgradeParameter upgradeParameter = getSettings().getUpgradeParameter();
    Writer outputWriter = getSettings().getOutputFile(getPrintWriter());
    upgradeService.extractDDL(upgradeParameter, outputWriter);
  }

  @Override
  protected CommandType getCommandType() {
    return CommandType.EXTRACT_DDL;
  }

}

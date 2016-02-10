package software.coolstuff.installapex.service.upgrade;

import java.io.Writer;

public interface UpgradeService {

  void updateDatabase(UpgradeParameter parameter);

  void extractDDL(UpgradeParameter parameter, Writer writer);

}

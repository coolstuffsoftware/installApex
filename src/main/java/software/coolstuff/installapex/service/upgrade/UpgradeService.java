package software.coolstuff.installapex.service.upgrade;

import java.sql.Connection;

public interface UpgradeService {

  void update(Connection connection, UpgradeParameter parameter);

}

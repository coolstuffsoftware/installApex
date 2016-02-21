package software.coolstuff.installapex.service.database;

import java.util.Map;

public interface DatabaseCheckService {

  String getApexVersion();

  Map<String, Long> getApexWorkspacesFor(String targetSchema);

  boolean existsApexApplication(int apexApplicationId);

  boolean isApexAdministrator();

}

package software.coolstuff.installapex.service.database;

import java.util.List;

public interface DatabaseCheckRepository {

  String getApexVersion();

  List<ApexWorkspace> getApexWorkspacesFor(String targetSchema);

  boolean existsApexApplication(int apexApplicationId);

  List<String> getSessionRoles();

  String getCurrentSchema();

  String getApexInstallationSchema();

  List<String> getSessionPrivs();

}

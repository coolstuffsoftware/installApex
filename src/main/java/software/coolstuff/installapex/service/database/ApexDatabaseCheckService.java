package software.coolstuff.installapex.service.database;

import java.util.Map;

public interface ApexDatabaseCheckService {

  String getApexVersion();

  Map<String, Integer> getApexWorkspacesFor(String targetSchema);

}

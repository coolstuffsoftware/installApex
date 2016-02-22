package software.coolstuff.installapex.service.database;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import software.coolstuff.installapex.exception.InstallApexException;
import software.coolstuff.installapex.exception.InstallApexException.Reason;

@Service
public class DatabaseCheckServiceImpl implements DatabaseCheckService {

  @Autowired
  private DatabaseCheckRepository repository;

  @Override
  public String getApexVersion() {
    try {
      return repository.getApexVersion();
    } catch (EmptyResultDataAccessException e) {
      throw new InstallApexException(Reason.NO_APEX_INSTALLED, e);
    }
  }

  @Override
  public Map<String, Long> getApexWorkspacesFor(String targetSchema) {
    List<ApexWorkspace> apexWorkspaces = repository.getApexWorkspacesFor(targetSchema);
    Map<String, Long> mappedWorkspaces = new HashMap<>();
    for (ApexWorkspace apexWorkspace : apexWorkspaces) {
      mappedWorkspaces.put(apexWorkspace.getName(), apexWorkspace.getId());
    }
    return mappedWorkspaces;
  }

  void setRepository(DatabaseCheckRepository repository) {
    this.repository = repository;
  }

}

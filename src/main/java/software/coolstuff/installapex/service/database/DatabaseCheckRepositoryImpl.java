package software.coolstuff.installapex.service.database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class DatabaseCheckRepositoryImpl implements DatabaseCheckRepository {

  private static final Logger log = LoggerFactory.getLogger(DatabaseCheckRepositoryImpl.class);

  @Autowired
  private JdbcTemplate jdbcTemplate;

  @Value("${databaseCheckRepository.queryApexVersion}")
  private String queryApexVersion;

  @Value("${databaseCheckRepository.queryApexWorkspacesForSchema}")
  private String queryApexWorkspacesForSchema;

  @Override
  public String getApexVersion() {
    log.debug("Execute Query: {}", queryApexVersion);
    return jdbcTemplate.queryForObject(queryApexVersion, String.class);
  }

  @Override
  public List<ApexWorkspace> getApexWorkspacesFor(String targetSchema) {
    log.debug("Execute Query: {} with Parameter: 1:{}", queryApexWorkspacesForSchema, targetSchema);
    return jdbcTemplate.query(queryApexWorkspacesForSchema, this::mapApexWorkspace, targetSchema);
  }

  private ApexWorkspace mapApexWorkspace(ResultSet rs, int rowNum) throws SQLException {
    ApexWorkspace apexWorkspace = new ApexWorkspace();
    apexWorkspace.setId(rs.getInt("WORKSPACE_ID"));
    apexWorkspace.setName(rs.getString("WORKSPACE_NAME"));
    return apexWorkspace;
  }

}

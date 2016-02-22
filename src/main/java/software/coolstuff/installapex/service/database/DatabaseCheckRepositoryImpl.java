package software.coolstuff.installapex.service.database;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.stereotype.Repository;

import net.sourceforge.cobertura.interaction.annotations.api.metrics.CoberturaIgnored;

@Repository
public class DatabaseCheckRepositoryImpl implements DatabaseCheckRepository {

  private static final Logger log = LoggerFactory.getLogger(DatabaseCheckRepositoryImpl.class);

  @Autowired
  private JdbcOperations operations;

  @Value("${databaseCheckRepository.queryApexVersion}")
  private String queryApexVersion;

  @Value("${databaseCheckRepository.queryApexWorkspacesForSchema}")
  private String queryApexWorkspacesForSchema;

  @Value("${databaseCheckRepository.queryExistsApexApplication}")
  private String queryExistsApexApplication;

  @Value("${databaseCheckRepository.querySessionRoles}")
  private String querySessionRoles;

  @Value("${databaseCheckRepository.queryCurrentSchema}")
  private String queryCurrentSchema;

  @Value("${databaseCheckRepository.querySessionPrivs}")
  private String querySessionPrivs;

  @Override
  public String getApexVersion() {
    log.debug("Execute Query: {}", queryApexVersion);
    return operations.queryForObject(queryApexVersion, String.class);
  }

  @Override
  public List<ApexWorkspace> getApexWorkspacesFor(String targetSchema) {
    log.debug("Execute Query: {} with Parameter: 1:{}", queryApexWorkspacesForSchema, targetSchema);
    return operations.query(queryApexWorkspacesForSchema, this::mapApexWorkspace, targetSchema);
  }

  private ApexWorkspace mapApexWorkspace(ResultSet rs, int rowNum) throws SQLException {
    ApexWorkspace apexWorkspace = new ApexWorkspace();
    apexWorkspace.setId(rs.getLong("WORKSPACE_ID"));
    apexWorkspace.setName(rs.getString("WORKSPACE_NAME"));
    return apexWorkspace;
  }

  @Override
  public boolean existsApexApplication(int apexApplicationId) {
    log.debug("Execute Query: {} with Parameter: 1:{}", queryExistsApexApplication, apexApplicationId);
    return operations.queryForObject(queryExistsApexApplication, Boolean.class, apexApplicationId);
  }

  @Override
  public List<String> getSessionRoles() {
    log.debug("Execute Query: {}", querySessionRoles);
    return operations.queryForList(querySessionRoles, String.class);
  }

  @Override
  public String getCurrentSchema() {
    log.debug("Execute Query {}", queryCurrentSchema);
    return operations.queryForObject(queryCurrentSchema, String.class);
  }

  @Override
  @CoberturaIgnored
  public String getApexInstallationSchema() {
    return operations.execute(this::queryApexInstallationSchema, this::mapApexInstallationSchema);
  }

  @CoberturaIgnored
  private CallableStatement queryApexInstallationSchema(Connection conn) throws SQLException {
    CallableStatement callableStatement = conn.prepareCall("{? = call APEX_APPLICATION.g_flow_schema_owner}");
    callableStatement.registerOutParameter(1, Types.VARCHAR);
    return callableStatement;
  }

  @CoberturaIgnored
  private String mapApexInstallationSchema(CallableStatement cs) throws SQLException, DataAccessException {
    cs.executeUpdate();
    return (String) cs.getObject(1);
  }

  @Override
  public List<String> getSessionPrivs() {
    log.debug("Execute Query {}", querySessionPrivs);
    return operations.queryForList(querySessionPrivs, String.class);
  }

}

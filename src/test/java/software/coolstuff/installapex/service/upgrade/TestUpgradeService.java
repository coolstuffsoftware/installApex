package software.coolstuff.installapex.service.upgrade;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabase;
import org.testng.Assert;
import org.testng.annotations.Test;

import software.coolstuff.installapex.AbstractInstallApexTestWithContext;
import software.coolstuff.installapex.exception.InstallApexException;

public class TestUpgradeService extends AbstractInstallApexTestWithContext {

  @Autowired
  private DataSource dataSource;

  @Autowired
  private UpgradeService upgradeService;

  @Test
  public void testOnEmbeddedDataSourceNotNull() throws SQLException {
    Assert.assertTrue(EmbeddedDatabase.class.isAssignableFrom(dataSource.getClass()));
    try (Connection connection = dataSource.getConnection()) {
      Assert.assertNotNull(connection);
    }
  }

  @Test
  public void testWithDefaultParameters() {
    UpgradeParameter upgradeParameter = new UpgradeParameter();
    upgradeService.updateDatabase(upgradeParameter);
  }

  @Test(dependsOnMethods = { "testWithDefaultParameters" }, expectedExceptions = InstallApexException.class,
      expectedExceptionsMessageRegExp = "installApexException.reason.upgradeError")
  public void testWithChangeLogTableInAnotherSchema() {
    UpgradeParameter upgradeParameter = new UpgradeParameter();
    upgradeParameter.setLiquibaseSchemaName("TEST2_UPGRADE");
    prepareUpgradeParameter(upgradeParameter);
    upgradeService.updateDatabase(upgradeParameter);
  }

  @Test
  public void testWithUpgradeInAnotherSchema() {
    UpgradeParameter upgradeParameter = new UpgradeParameter();
    upgradeParameter.setDefaultSchemaName("TEST3_DATA");
    prepareUpgradeParameter(upgradeParameter);
    upgradeService.updateDatabase(upgradeParameter);
  }

  @Test
  public void testWithChangeLogTableInAnotherSchemaAndWithUpgradeInAnotherSchema() {
    UpgradeParameter upgradeParameter = new UpgradeParameter();
    upgradeParameter.setLiquibaseSchemaName("TEST4_UPGRADE");
    upgradeParameter.setDefaultSchemaName("TEST4_DATA");
    prepareUpgradeParameter(upgradeParameter);
    upgradeService.updateDatabase(upgradeParameter);
  }

  private void prepareUpgradeParameter(UpgradeParameter upgradeParameter) {
    try (Connection connection = dataSource.getConnection()) {
      createSchema(connection, upgradeParameter.getLiquibaseSchemaName());
      createSchema(connection, upgradeParameter.getDefaultSchemaName());
    } catch (SQLException e) {
      throw new RuntimeException("Error while preparing the Schema", e);
    }
  }

  private void createSchema(Connection conn, String schemaName) throws SQLException {
    if (StringUtils.isBlank(schemaName)) {
      return;
    }
    PreparedStatement stmt = null;
    try {
      stmt = conn.prepareStatement(String.format("CREATE SCHEMA %s", schemaName));
      stmt.execute();
    } finally {
      if (stmt != null && !stmt.isClosed()) {
        stmt.close();
      }
    }
  }

}

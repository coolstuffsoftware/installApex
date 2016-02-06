package io.github.mufasa1976.installApex.service.upgrade;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabase;
import org.testng.Assert;
import org.testng.annotations.Test;

import io.github.mufasa1976.installApex.AbstractInstallApexTestWithContext;
import io.github.mufasa1976.installApex.exception.InstallApexException;

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
  public void testWithDefaultParameters() throws SQLException {
    try (Connection connection = dataSource.getConnection()) {
      UpgradeParameter upgradeParameter = new UpgradeParameter();
      upgradeService.update(connection, upgradeParameter);
    }
  }

  @Test(dependsOnMethods = { "testWithDefaultParameters" }, expectedExceptions = InstallApexException.class,
      expectedExceptionsMessageRegExp = "installApexException.reason.upgradeError")
  public void testWithChangeLogTableInAnotherSchema() throws SQLException {
    try (Connection connection = dataSource.getConnection()) {
      UpgradeParameter upgradeParameter = new UpgradeParameter();
      upgradeParameter.setLiquibaseSchemaName("TEST2_UPGRADE");
      prepareUpgradeParameter(upgradeParameter);
      upgradeService.update(connection, upgradeParameter);
    }
  }

  @Test
  public void testWithUpgradeInAnotherSchema() throws SQLException {
    try (Connection connection = dataSource.getConnection()) {
      UpgradeParameter upgradeParameter = new UpgradeParameter();
      upgradeParameter.setDefaultSchemaName("TEST3_DATA");
      prepareUpgradeParameter(upgradeParameter);
      upgradeService.update(connection, upgradeParameter);
    }
  }

  @Test
  public void testWithChangeLogTableInAnotherSchemaAndWithUpgradeInAnotherSchema() throws SQLException {
    try (Connection connection = dataSource.getConnection()) {
      UpgradeParameter upgradeParameter = new UpgradeParameter();
      upgradeParameter.setLiquibaseSchemaName("TEST4_UPGRADE");
      upgradeParameter.setDefaultSchemaName("TEST4_DATA");
      prepareUpgradeParameter(upgradeParameter);
      upgradeService.update(connection, upgradeParameter);
    }
  }

  private void prepareUpgradeParameter(UpgradeParameter upgradeParameter) throws SQLException {
    try (Connection connection = dataSource.getConnection()) {
      createSchema(connection, upgradeParameter.getLiquibaseSchemaName());
      createSchema(connection, upgradeParameter.getDefaultSchemaName());
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

package io.github.mufasa1976.installApex.command.database;

import io.github.mufasa1976.installApex.command.CommandType;
import io.github.mufasa1976.installApex.command.settings.CommandSettings;
import io.github.mufasa1976.installApex.command.settings.LiquibaseParameters;
import io.github.mufasa1976.installApex.config.TestApplicationConfiguration;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import liquibase.Liquibase;
import liquibase.exception.LiquibaseException;
import liquibase.exception.MigrationFailedException;

import org.apache.commons.lang.StringUtils;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.testng.annotations.Test;

@ContextConfiguration(classes = TestApplicationConfiguration.class)
public class TestAbstractLiquibaseCommand extends AbstractTestNGSpringContextTests {

  @Autowired
  private DataSource dataSource;

  @Autowired
  private AutowiredAnnotationBeanPostProcessor beanPostProcessor;

  @Test
  public void testWithDefaultParameters() throws SQLException, LiquibaseException {
    LiquibaseParameters liquibaseParameters = new LiquibaseParameters();
    testParameters(liquibaseParameters);
  }

  @Test
  public void testWithDefaultSchemaParameters() throws SQLException, LiquibaseException {
    LiquibaseParameters liquibaseParameters = new LiquibaseParameters();
    liquibaseParameters.setDefaultSchemaName("TEST1_SCHEMA");
    prepareLiquibaseParameters(liquibaseParameters);
    testParameters(liquibaseParameters);
  }

  @Test(expectedExceptions = MigrationFailedException.class)
  public void testWithLiquibaseSchemaParameters() throws SQLException, LiquibaseException {
    LiquibaseParameters liquibaseParameters = new LiquibaseParameters();
    liquibaseParameters.setLiquibaseSchemaName("TEST2_LIQUIBASE");
    prepareLiquibaseParameters(liquibaseParameters);
    testParameters(liquibaseParameters);
  }

  @Test
  public void testWithDefaultSchemaAndLiquibaseSchemaParameters() throws SQLException, LiquibaseException {
    LiquibaseParameters liquibaseParameters = new LiquibaseParameters();
    liquibaseParameters.setLiquibaseSchemaName("TEST3_LIQUIBASE");
    liquibaseParameters.setDefaultSchemaName("TEST3_SCHEMA");
    prepareLiquibaseParameters(liquibaseParameters);
    testParameters(liquibaseParameters);
  }

  private void testParameters(LiquibaseParameters liquibaseParameters) throws SQLException, LiquibaseException {
    final CommandSettings commandSettings = Mockito.mock(CommandSettings.class);
    Mockito.when(commandSettings.getLiquibaseParameters()).thenReturn(liquibaseParameters);
    Mockito.when(commandSettings.getDataSource(Mockito.anyString())).thenReturn(dataSource);
    AbstractLiquibaseCommand command = new AbstractLiquibaseCommand() {

      @Override
      public void execute() {}

      @Override
      protected CommandType getCommandType() {
        return null;
      }

      @Override
      protected CommandSettings getSettings() {
        return commandSettings;
      }

    };
    beanPostProcessor.processInjection(command);
    try (Connection connection = dataSource.getConnection()) {
      Liquibase liquibase = command.getLiquibase(connection);
      liquibase.update((String) null);
    }
  }

  private void prepareLiquibaseParameters(LiquibaseParameters liquibaseParameters) throws SQLException {
    try (Connection connection = dataSource.getConnection()) {
      createSchema(connection, liquibaseParameters.getLiquibaseSchemaName());
      createSchema(connection, liquibaseParameters.getDefaultSchemaName());
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

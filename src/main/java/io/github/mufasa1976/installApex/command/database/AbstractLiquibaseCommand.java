package io.github.mufasa1976.installApex.command.database;

import io.github.mufasa1976.installApex.command.settings.LiquibaseParameter;

import java.sql.Connection;

import liquibase.Liquibase;
import liquibase.database.Database;
import liquibase.database.DatabaseConnection;
import liquibase.database.DatabaseFactory;
import liquibase.database.jvm.JdbcConnection;
import liquibase.exception.DatabaseException;
import liquibase.exception.LiquibaseException;
import liquibase.resource.ResourceAccessor;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;

public abstract class AbstractLiquibaseCommand extends AbstractDataSourceCommand {

  private static final Logger log = LoggerFactory.getLogger(AbstractLiquibaseCommand.class);

  private static final String DATABASE_CHANGELOG_FILENAME = "databaseChangeLogFileName";
  private static final String DATABASE_CHANGELOG_TABLE_NAME = "databaseChangeLogTableName";
  private static final String DATABASE_CHANGELOG_LOCK_TABLE_NAME = "databaseChangeLogLockTableName";
  private static final String DEFAULT_SCHEMA_NAME = "defaultSchemaName";
  private static final String LIQUIBASE_SCHEMA_NAME = "liquibaseSchemaName";
  private static final String LIQUIBASE_TABLESPACE_NAME = "liquibaseTablespaceName";

  @Value("${abstractLiquibaseCommand.databaseChangeLogFileName}")
  private String databaseChangeLogFileName;

  @Autowired
  private ResourceAccessor resourceAccessor;

  @Autowired
  private DatabaseFactory databaseFactory;

  @Autowired
  private Environment environment;

  protected Liquibase getLiquibase(Connection connection) throws LiquibaseException {
    DatabaseConnection databaseConnection = getDatabaseConnection(connection);
    Database database = getDatabase(databaseConnection);
    Liquibase liquibase = new Liquibase(getDatabaseChangelogFileName(), resourceAccessor, database);
    liquibase.setIgnoreClasspathPrefix(true);
    injectParameters(liquibase);
    return liquibase;
  }

  private DatabaseConnection getDatabaseConnection(Connection connection) {
    return new JdbcConnection(connection);
  }

  private Database getDatabase(DatabaseConnection databaseConnection) throws DatabaseException {
    Database database = databaseFactory.findCorrectDatabaseImplementation(databaseConnection);
    LiquibaseParameter liquibaseParameters = getSettings().getLiquibaseParameter();
    setLiquibaseDatabaseProperties(database, liquibaseParameters);
    return database;
  }

  private void setLiquibaseDatabaseProperties(Database database, LiquibaseParameter liquibaseParameters)
      throws DatabaseException {
    if (liquibaseParameters == null) {
      return;
    }
    if (StringUtils.isNotBlank(liquibaseParameters.getDatabaseChangeLogTableName())) {
      log.debug("Set the Database ChangeLog Table Name to {}", liquibaseParameters.getDatabaseChangeLogTableName());
      database.setDatabaseChangeLogTableName(liquibaseParameters.getDatabaseChangeLogTableName());
    }
    if (StringUtils.isNotBlank(liquibaseParameters.getDatabaseChangeLogLockTableName())) {
      log.debug("Set the Database ChangeLog Lock Table Name to {}",
          liquibaseParameters.getDatabaseChangeLogLockTableName());
      database.setDatabaseChangeLogLockTableName(liquibaseParameters.getDatabaseChangeLogLockTableName());
    }
    if (StringUtils.isNotBlank(liquibaseParameters.getDefaultSchemaName())) {
      log.debug("Set the Default Schema to {}", liquibaseParameters.getDefaultSchemaName());
      database.setDefaultSchemaName(liquibaseParameters.getDefaultSchemaName());
    }
    if (StringUtils.isNotBlank(liquibaseParameters.getLiquibaseSchemaName())) {
      log.debug("Set the Liquibase Schema to {}", liquibaseParameters.getLiquibaseSchemaName());
      database.setLiquibaseSchemaName(liquibaseParameters.getLiquibaseSchemaName());
    }
    if (StringUtils.isNotBlank(liquibaseParameters.getLiquibaseTablespaceName())) {
      log.debug("Set the Liquibase Tablespace to {}", liquibaseParameters.getLiquibaseTablespaceName());
      database.setLiquibaseTablespaceName(liquibaseParameters.getLiquibaseTablespaceName());
    }
  }

  private String getDatabaseChangelogFileName() {
    return databaseChangeLogFileName;
  }

  private void injectParameters(Liquibase liquibase) throws LiquibaseException {
    Database database = liquibase.getDatabase();
    injectParameter(liquibase, DATABASE_CHANGELOG_TABLE_NAME, database.getDatabaseChangeLogTableName());
    injectParameter(liquibase, DATABASE_CHANGELOG_LOCK_TABLE_NAME, database.getDatabaseChangeLogLockTableName());
    injectParameter(liquibase, DEFAULT_SCHEMA_NAME, database.getDefaultSchemaName());
    injectParameter(liquibase, LIQUIBASE_SCHEMA_NAME, database.getLiquibaseSchemaName());
    injectParameter(liquibase, LIQUIBASE_TABLESPACE_NAME, database.getLiquibaseTablespaceName());

    // the Filename must be injected at last because it causes liquibase to
    // parse the changelog. after the parsing no injection would be possible
    injectParameter(liquibase, DATABASE_CHANGELOG_FILENAME, liquibase.getChangeLogFile());
  }

  private void injectParameter(Liquibase liquibase, String parameter, String value) {
    if (StringUtils.isNotBlank(value)) {
      liquibase.setChangeLogParameter(parameter, value);
    }
  }

}

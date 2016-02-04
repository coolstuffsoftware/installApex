package io.github.mufasa1976.installApex.service.liquibase;

import java.sql.Connection;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import liquibase.Contexts;
import liquibase.Liquibase;
import liquibase.database.Database;
import liquibase.database.DatabaseConnection;
import liquibase.database.DatabaseFactory;
import liquibase.database.jvm.JdbcConnection;
import liquibase.exception.DatabaseException;
import liquibase.exception.LiquibaseException;
import liquibase.resource.ResourceAccessor;

@Service
public class LiquibaseServiceImpl implements LiquibaseService {

  private static final Logger log = LoggerFactory.getLogger(LiquibaseServiceImpl.class);

  private static final String DATABASE_CHANGELOG_FILENAME = "databaseChangeLogFileName";
  private static final String DATABASE_CHANGELOG_TABLE_NAME = "databaseChangeLogTableName";
  private static final String DATABASE_CHANGELOG_LOCK_TABLE_NAME = "databaseChangeLogLockTableName";
  private static final String DEFAULT_SCHEMA_NAME = "defaultSchemaName";
  private static final String LIQUIBASE_SCHEMA_NAME = "liquibaseSchemaName";
  private static final String LIQUIBASE_TABLESPACE_NAME = "liquibaseTablespaceName";

  @Value("${liquibaseService.databaseChangeLogFileName}")
  private String databaseChangeLogFileName;

  @Autowired
  private ResourceAccessor resourceAccessor;

  @Autowired
  private DatabaseFactory databaseFactory;

  @Override
  public void update(Connection connection, LiquibaseParameter parameter) {
    try {
      Liquibase liquibase = getLiquibase(connection, parameter);
      Contexts contexts = convertToContexts(parameter.getApexApplications());
      liquibase.update(contexts);
    } catch (LiquibaseException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
  }

  private Liquibase getLiquibase(Connection connection, LiquibaseParameter parameter) throws LiquibaseException {
    DatabaseConnection databaseConnection = getDatabaseConnection(connection);
    Database database = getDatabase(databaseConnection, parameter);
    Liquibase liquibase = new Liquibase(getDatabaseChangelogFileName(), resourceAccessor, database);
    liquibase.setIgnoreClasspathPrefix(true);
    injectParameters(liquibase);
    return liquibase;
  }

  private DatabaseConnection getDatabaseConnection(Connection connection) {
    return new JdbcConnection(connection);
  }

  private Database getDatabase(DatabaseConnection databaseConnection, LiquibaseParameter parameter)
      throws DatabaseException {
    Database database = databaseFactory.findCorrectDatabaseImplementation(databaseConnection);
    setLiquibaseDatabaseProperties(database, parameter);
    return database;
  }

  private void setLiquibaseDatabaseProperties(Database database, LiquibaseParameter paramter) throws DatabaseException {
    if (paramter == null) {
      return;
    }
    if (StringUtils.isNotBlank(paramter.getDatabaseChangeLogTableName())) {
      log.debug("Set the Database ChangeLog Table Name to {}", paramter.getDatabaseChangeLogTableName());
      database.setDatabaseChangeLogTableName(paramter.getDatabaseChangeLogTableName());
    }
    if (StringUtils.isNotBlank(paramter.getDatabaseChangeLogLockTableName())) {
      log.debug("Set the Database ChangeLog Lock Table Name to {}", paramter.getDatabaseChangeLogLockTableName());
      database.setDatabaseChangeLogLockTableName(paramter.getDatabaseChangeLogLockTableName());
    }
    if (StringUtils.isNotBlank(paramter.getDefaultSchemaName())) {
      log.debug("Set the Default Schema to {}", paramter.getDefaultSchemaName());
      database.setDefaultSchemaName(paramter.getDefaultSchemaName());
    }
    if (StringUtils.isNotBlank(paramter.getLiquibaseSchemaName())) {
      log.debug("Set the Liquibase Schema to {}", paramter.getLiquibaseSchemaName());
      database.setLiquibaseSchemaName(paramter.getLiquibaseSchemaName());
    }
    if (StringUtils.isNotBlank(paramter.getLiquibaseTablespaceName())) {
      log.debug("Set the Liquibase Tablespace to {}", paramter.getLiquibaseTablespaceName());
      database.setLiquibaseTablespaceName(paramter.getLiquibaseTablespaceName());
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

  private Contexts convertToContexts(Set<Integer> apexApplications) {
    // TODO Auto-generated method stub
    return null;
  }

}

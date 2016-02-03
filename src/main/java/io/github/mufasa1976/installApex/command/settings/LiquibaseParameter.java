package io.github.mufasa1976.installApex.command.settings;

public class LiquibaseParameter {

  private String databaseChangeLogTableName;
  private String databaseChangeLogLockTableName;
  private String defaultSchemaName;
  private String liquibaseSchemaName;
  private String liquibaseTablespaceName;

  public String getDatabaseChangeLogTableName() {
    return databaseChangeLogTableName;
  }

  public void setDatabaseChangeLogTableName(String databaseChangeLogTableName) {
    this.databaseChangeLogTableName = databaseChangeLogTableName;
  }

  public String getDatabaseChangeLogLockTableName() {
    return databaseChangeLogLockTableName;
  }

  public void setDatabaseChangeLogLockTableName(String databaseChangeLogLockTableName) {
    this.databaseChangeLogLockTableName = databaseChangeLogLockTableName;
  }

  public String getDefaultSchemaName() {
    return defaultSchemaName;
  }

  public void setDefaultSchemaName(String defaultSchemaName) {
    this.defaultSchemaName = defaultSchemaName;
  }

  public String getLiquibaseSchemaName() {
    return liquibaseSchemaName;
  }

  public void setLiquibaseSchemaName(String liquibaseSchemaName) {
    this.liquibaseSchemaName = liquibaseSchemaName;
  }

  public String getLiquibaseTablespaceName() {
    return liquibaseTablespaceName;
  }

  public void setLiquibaseTablespaceName(String liquibaseTablespaceName) {
    this.liquibaseTablespaceName = liquibaseTablespaceName;
  }

}

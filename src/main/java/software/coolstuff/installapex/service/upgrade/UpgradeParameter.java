package software.coolstuff.installapex.service.upgrade;

import java.util.Objects;

import org.apache.commons.lang.StringUtils;

public class UpgradeParameter {

  private String databaseChangeLogTableName;
  private String databaseChangeLogLockTableName;
  private String defaultSchemaName;
  private String liquibaseSchemaName;
  private String liquibaseTablespaceName;
  private Integer apexApplication;

  private String dbUser;
  private String dbConnection;

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

  public void setApexApplication(Integer apexApplication) {
    this.apexApplication = apexApplication;
  }

  public Integer getApexApplication() {
    return apexApplication;
  }

  public void setDbUser(String dbUser) {
    this.dbUser = dbUser;
  }

  public String getDbUser() {
    return dbUser;
  }

  public String getLiquibaseSchemaNameDefaultedByDbUser() {
    if (StringUtils.isNotBlank(liquibaseSchemaName)) {
      return liquibaseSchemaName;
    }
    return dbUser;
  }

  public void setDbConnection(String dbConnection) {
    this.dbConnection = dbConnection;
  }

  public String getDbConnection() {
    return dbConnection;
  }

  @Override
  public int hashCode() {
    return Objects.hash(databaseChangeLogTableName, databaseChangeLogLockTableName, defaultSchemaName,
        liquibaseSchemaName, liquibaseTablespaceName, apexApplication, dbUser, dbConnection);
  }

  @Override
  public boolean equals(Object obj) {
    if (!(obj instanceof UpgradeParameter)) {
      return false;
    }

    UpgradeParameter otherObj = (UpgradeParameter) obj;
    return Objects.equals(databaseChangeLogTableName, otherObj.databaseChangeLogTableName)
        && Objects.equals(databaseChangeLogLockTableName, otherObj.databaseChangeLogLockTableName)
        && Objects.equals(defaultSchemaName, otherObj.defaultSchemaName)
        && Objects.equals(liquibaseSchemaName, otherObj.liquibaseSchemaName)
        && Objects.equals(liquibaseTablespaceName, otherObj.liquibaseTablespaceName)
        && Objects.equals(apexApplication, otherObj.apexApplication) && Objects.equals(dbUser, otherObj.dbUser)
        && Objects.equals(dbConnection, otherObj.dbConnection);
  }

}

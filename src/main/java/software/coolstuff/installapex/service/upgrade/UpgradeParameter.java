package software.coolstuff.installapex.service.upgrade;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

public class UpgradeParameter {

  private String databaseChangeLogTableName;
  private String databaseChangeLogLockTableName;
  private String defaultSchemaName;
  private String liquibaseSchemaName;
  private String liquibaseTablespaceName;
  private Set<Integer> apexApplications = new HashSet<>();

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

  public void setApexApplications(Collection<Integer> apexApplications) {
    this.apexApplications = new HashSet<>(apexApplications);
  }

  public void addApexApplications(Collection<Integer> apexApplications) {
    this.apexApplications.addAll(apexApplications);
  }

  public void addApexApplication(int apexApplication) {
    apexApplications.add(apexApplication);
  }

  public void removeApexApplication(int apexApplication) {
    apexApplications.remove(apexApplication);
  }

  public void clearApexApplications() {
    apexApplications.clear();
  }

  public Set<Integer> getApexApplications() {
    return apexApplications;
  }

}

package io.github.mufasa1976.installApex.command.settings;

import java.nio.file.Path;

import javax.sql.DataSource;

import io.github.mufasa1976.installApex.service.apex.ApexParameter;
import io.github.mufasa1976.installApex.service.upgrade.UpgradeParameter;

public interface CommandSettings {

  Path getTemporaryDirectory(boolean createIfNotExists);

  DataSource getDataSource(String password);

  ProcessBuilder getSQLPlusCommand();

  String getSQLPlusConnect(String password);

  String getSQLPlusConnect();

  boolean isForce();

  boolean isQuiet();

  boolean isPasswordAvailable();

  boolean isPasswordNotAvailable();

  String getPassword();

  boolean isApexIdAvailable();

  Integer getSourceApexId();

  UpgradeParameter getUpgradeParameter();

  ApexParameter getApexParameter();

}

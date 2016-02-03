package io.github.mufasa1976.installApex.command.settings;

import java.nio.file.Path;

import javax.sql.DataSource;

public interface CommandSettings {

  Path getTemporaryDirectory(boolean createIfNotExists);

  DataSource getDataSource(String password);

  ProcessBuilder getSQLPlusCommand();

  String buildSQLPlusConnect(String password);

  boolean isForce();

  boolean isQuiet();

  boolean isPasswordAvailable();

  boolean isPasswordNotAvailable();

  String getPassword();

  LiquibaseParameters getLiquibaseParameters();

  boolean isInstallSchemaAvailable();

  String getInstallSchema();

}

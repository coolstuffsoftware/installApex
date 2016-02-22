package software.coolstuff.installapex.command.settings;

import java.io.Writer;
import java.nio.file.Path;

import javax.sql.DataSource;

import software.coolstuff.installapex.service.apex.ApexParameter;
import software.coolstuff.installapex.service.upgrade.UpgradeParameter;

public interface CommandSettings {

  Path getTemporaryDirectory(boolean createIfNotExists);

  DataSource getDataSource(String password);

  ProcessBuilder getSQLPlusCommand();

  String getSQLPlusConnect(String password);

  String getSQLPlusConnect();

  boolean isQuiet();

  boolean isPasswordAvailable();

  boolean isPasswordNotAvailable();

  String getPassword();

  UpgradeParameter getUpgradeParameter();

  ApexParameter getApexParameter();

  boolean isInstallInOtherSchema();

  boolean isChangeLogInOtherSchema();

  Writer getOutputFile(Writer consoleWriter);

  Path getOutputDirectory();

  boolean isOutputToConsole();

}

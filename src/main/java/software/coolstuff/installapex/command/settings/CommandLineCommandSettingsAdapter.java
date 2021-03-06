package software.coolstuff.installapex.command.settings;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.Map;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.SystemUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import oracle.jdbc.pool.OracleDataSource;
import software.coolstuff.installapex.cli.CommandLineOption;
import software.coolstuff.installapex.command.CommandType;
import software.coolstuff.installapex.exception.InstallApexException;
import software.coolstuff.installapex.exception.InstallApexException.Reason;
import software.coolstuff.installapex.service.apex.ApexParameter;
import software.coolstuff.installapex.service.upgrade.UpgradeParameter;

public class CommandLineCommandSettingsAdapter implements CommandSettings {

  private static final Logger log = LoggerFactory.getLogger(CommandLineCommandSettingsAdapter.class);

  private final static String ORACLE_DRIVER_TYPE = "thin";

  private final CommandType commandType;
  private final CommandLine commandLine;

  public CommandLineCommandSettingsAdapter(CommandType commandType, CommandLine commandLine) {
    this.commandType = commandType;
    this.commandLine = commandLine;
  }

  @Override
  public Path getTemporaryDirectory(boolean createIfNotExists) {
    Path temporaryDirectory = getPathByOptionalArgumentOf(CommandLineOption.TEMP_DIRECTORY);
    checkIsDirectory(temporaryDirectory, CommandLineOption.TEMP_DIRECTORY);

    if (temporaryDirectory == null) {
      temporaryDirectory = getPathBySystemProperty("java.io.tmpdir");
      checkIsDirectory(temporaryDirectory, "java.io.tmpdir");
    }

    if (temporaryDirectory == null) {
      missingRequiredCommandLineOption(CommandLineOption.TEMP_DIRECTORY);
    }

    if (Files.exists(temporaryDirectory)) {
      return temporaryDirectory;
    }

    createDirectoryIfAllowed(CommandLineOption.TEMP_DIRECTORY, temporaryDirectory, createIfNotExists);
    return temporaryDirectory;
  }

  private Path getPathByOptionalArgumentOf(CommandLineOption option) {
    String pathAsString = getValueByOptionalArgumentOf(option);
    if (StringUtils.isBlank(pathAsString)) {
      return null;
    }
    return Paths.get(pathAsString);
  }

  private String getValueByOptionalArgumentOf(CommandLineOption option) {
    if (option == null || option.isNotAvailableOn(commandLine)) {
      return null;
    }
    log.debug("Get the Value of the CommandLine Option {}", option.getLongOption());
    return option.getArgumentValue(commandLine);
  }

  private void checkIsDirectory(Path locationToCheck, CommandLineOption option) {
    if (locationToCheck == null || !Files.exists(locationToCheck)) {
      return;
    }
    if (!Files.isDirectory(locationToCheck)) {
      throw new InstallApexException(Reason.CLI_ARGUMENT_NO_DIRECTORY, option.getLongOption("--"), locationToCheck);
    }
  }

  private Path getPathBySystemProperty(String systemPropertyKey) {
    log.debug("Get the Value of SystemProperty {}", systemPropertyKey);
    String systemProperty = System.getProperty(systemPropertyKey);
    if (StringUtils.isBlank(systemProperty)) {
      return null;
    }

    return Paths.get(systemProperty);
  }

  private void checkIsDirectory(Path locationToCheck, String systemPropertyKey) {
    if (locationToCheck == null || !Files.exists(locationToCheck)) {
      return;
    }
    if (!Files.isDirectory(locationToCheck)) {
      throw new InstallApexException(Reason.CLI_ENV_VARIABLE_NO_DIRECTORY, systemPropertyKey, locationToCheck);
    }
  }

  private void missingRequiredCommandLineOption(CommandLineOption option) {
    throw new InstallApexException(Reason.CLI_MISSING_REQUIRED_OPTION, option.getLongOption("--"),
        commandType.getLongOption("--"));
  }

  private void createDirectoryIfAllowed(CommandLineOption option, Path directory, boolean createIfNotExists) {
    if (!createIfNotExists) {
      throw new IllegalStateException(String.format("Not allowed to create Directory '%s' due to CommandLine Option %s",
          directory.toAbsolutePath(), option.getLongOption()));
    }

    try {
      log.debug("Create Directory {} due to CommandLine Option {}", directory.toAbsolutePath(), option.getLongOption());
      Files.createDirectory(directory);
      directory.toFile().deleteOnExit();
    } catch (IOException e) {
      throw new InstallApexException(Reason.CREATE_DIRECTORY_ERROR, e, directory, option.getLongOption("--"),
          e.getMessage());
    }
  }

  @Override
  public DataSource getDataSource(String password) {
    Path tnsAdmin = evaluateTNSAdmin();
    setSystemProperty("oracle.net.tns_admin", tnsAdmin);

    String databaseConnect = getValueByArgumentOf(CommandLineOption.DB_CONNECT);
    String databaseUser = getValueByArgumentOf(CommandLineOption.DB_USER);
    boolean sysdba = isOptionSet(CommandLineOption.SYSDBA);

    Properties properties = new Properties();
    if (sysdba) {
      properties.setProperty("internal_logon", "SYSDBA");
    }

    OracleDataSource dataSource = null;
    try {
      dataSource = new OracleDataSource();
      dataSource.setConnectionProperties(properties);
      dataSource.setDriverType(ORACLE_DRIVER_TYPE);
      dataSource.setTNSEntryName(databaseConnect);
      dataSource.setUser(databaseUser);
      if (StringUtils.isNotBlank(password)) {
        dataSource.setPassword(password);
      }
    } catch (SQLException e) {
      throw new InstallApexException(Reason.CREATE_DATASOURCE_ERROR, e, databaseConnect, databaseUser, e.getMessage());
    }

    return dataSource;
  }

  public boolean isOptionSet(CommandLineOption option) {
    return option.isAvailableOn(commandLine);
  }

  public boolean isOptionNotSet(CommandLineOption option) {
    return !isOptionSet(option);
  }

  private Path evaluateTNSAdmin() {
    Path tnsAdmin = getPathByOptionalArgumentOf(CommandLineOption.TNS_ADMIN);
    checkIsDirectory(tnsAdmin, CommandLineOption.TNS_ADMIN);

    if (tnsAdmin == null) {
      tnsAdmin = getPathByEnvironmentVariable("TNS_ADMIN");
      checkIsDirectory(tnsAdmin, "TNS_ADMIN");
    }

    if (tnsAdmin == null) {
      tnsAdmin = getPathByEnvironmentVariable("ORACLE_HOME", Paths.get("network", "admin"));
      checkIsDirectory(tnsAdmin, "TNS_ADMIN");
    }

    return tnsAdmin;
  }

  private Path getPathByEnvironmentVariable(String environmentVariable) {
    return getPathByEnvironmentVariable(environmentVariable, null);
  }

  private Path getPathByEnvironmentVariable(String environmentVariable, Path optionalSuffix) {
    log.debug("Get the Value of the Environment Variable {}", environmentVariable);
    String value = System.getenv(environmentVariable);
    if (StringUtils.isBlank(value)) {
      return null;
    }
    Path location = Paths.get(value);
    if (optionalSuffix != null) {
      location = location.resolve(optionalSuffix);
    }
    return location;
  }

  private void setSystemProperty(String systemProperty, Path path) {
    if (path != null && StringUtils.isNotBlank(systemProperty)) {
      System.setProperty(systemProperty, path.toAbsolutePath().toString());
    }
  }

  private String getValueByArgumentOf(CommandLineOption option) {
    return getValueByArgumentOf(option, null);
  }

  private String getValueByArgumentOf(CommandLineOption option, String defaultValue) {
    if (option.isNotAvailableOn(commandLine)) {
      return getDefaultArgumentValue(option, defaultValue);
    }
    log.debug("Get the Value of the CommandLine Option {}", option.getLongOption());
    return option.getArgumentValue(commandLine);
  }

  private String getDefaultArgumentValue(CommandLineOption option, String defaultValue) {
    if (defaultValue == null) {
      missingRequiredCommandLineOption(option);
    }
    return defaultValue;
  }

  @Override
  public ProcessBuilder getSQLPlusCommand() {
    Path oracleHome = evaluateOracleHome();

    Path sqlPlusExecutable = evaluateSQLPlusExecutable(oracleHome);
    ProcessBuilder processBuilder = new ProcessBuilder(sqlPlusExecutable.toAbsolutePath().toString(), "-s", "/nolog");
    setSqlPlusEnvironment(processBuilder, oracleHome);
    return processBuilder;
  }

  private Path evaluateOracleHome() {
    Path oracleHome = getPathByOptionalArgumentOf(CommandLineOption.ORACLE_HOME);
    checkIsDirectory(oracleHome, CommandLineOption.ORACLE_HOME);

    if (oracleHome == null) {
      oracleHome = getPathByEnvironmentVariable("ORACLE_HOME");
      checkIsDirectory(oracleHome, "ORACLE_HOME");
    }

    if (oracleHome == null) {
      missingRequiredCommandLineOption(CommandLineOption.ORACLE_HOME, "ORACLE_HOME");
    }

    return oracleHome;
  }

  private void missingRequiredCommandLineOption(CommandLineOption option,
      String systemPropertyKeyOrEnvironmentVariable) {
    throw new InstallApexException(Reason.CLI_OPTION_EVALUATION_ERROR, systemPropertyKeyOrEnvironmentVariable,
        option.getLongOption(), commandType.getLongOption());
  }

  private Path evaluateSQLPlusExecutable(Path oracleHome) {
    Path sqlPlusExecutable = getPathByOptionalArgumentOf(CommandLineOption.SQLPLUS_EXECUTABLE);
    checkIsExecutableFile(sqlPlusExecutable, CommandLineOption.SQLPLUS_EXECUTABLE);

    if (sqlPlusExecutable == null) {
      sqlPlusExecutable = getPathByEnvironmentVariable("ORACLE_HOME", Paths.get("bin", getSQLPlusFileName()));
      checkIsExecutableFile(sqlPlusExecutable, CommandLineOption.SQLPLUS_EXECUTABLE, "ORACLE_HOME");
    }

    if (sqlPlusExecutable == null) {
      missingRequiredCommandLineOption(CommandLineOption.SQLPLUS_EXECUTABLE, "ORACLE_HOME");
    }

    return sqlPlusExecutable;
  }

  private String getSQLPlusFileName() {
    String executableFileName = "sqlplus";
    if (SystemUtils.IS_OS_WINDOWS) {
      executableFileName += ".exe";
    }
    return executableFileName;
  }

  private void checkIsExecutableFile(Path path, CommandLineOption option, String environmentVariable) {
    if (path == null) {
      return;
    }

    if (Files.isDirectory(path)) {
      throw new InstallApexException(Reason.CLI_ENV_VARIABLE_NO_FILE, environmentVariable, option.getLongOption("--"),
          path.toAbsolutePath());
    }
    if (!Files.isExecutable(path)) {
      throw new InstallApexException(Reason.CLI_ENV_VARIABLE_FILE_WITHOUT_EXECUTION_PRIVS, environmentVariable,
          option.getLongOption("--"), path.toAbsolutePath());
    }

  }

  private void checkIsExecutableFile(Path path, CommandLineOption option) {
    if (path == null) {
      return;
    }

    if (Files.isDirectory(path)) {
      throw new InstallApexException(Reason.CLI_ARGUMENT_NO_FILE, option.getLongOption("--"), path.toAbsolutePath());
    }
    if (!Files.isExecutable(path)) {
      throw new InstallApexException(Reason.CLI_ARGUMENT_FILE_WITHOUT_EXECUTION_PRIVS, option.getLongOption("--"),
          path.toAbsolutePath());
    }
  }

  private void setSqlPlusEnvironment(ProcessBuilder processBuilder, Path oracleHome) {
    Map<String, String> environment = processBuilder.environment();
    Path tnsAdmin = evaluateTNSAdmin();
    String libraryPath = getLibraryPath(oracleHome);
    String nlsLang = evaluateNLSLang();

    putIntoEnvironment(environment, "ORACLE_HOME", oracleHome);
    putIntoEnvironment(environment, "TNS_ADMIN", tnsAdmin);
    putIntoEnvironment(environment, "NLS_LANG", nlsLang);
    putIntoEnvironment(environment, "PATH", System.getenv("PATH"));

    putIntoEnvironment(environment, "LD_LIBRARY_PATH", libraryPath);
    putIntoEnvironment(environment, "DYLD_LIBRARY_PATH", libraryPath);
    putIntoEnvironment(environment, "LIBPATH", libraryPath);
    putIntoEnvironment(environment, "SHLIB_PATH", libraryPath);
  }

  private String getLibraryPath(Path oracleHome) {
    String libraryPathAsString = getValueByOptionalArgumentOf(CommandLineOption.LIBPATH);
    libraryPathAsString = getLibraryPathByEnvironentIfBlank(libraryPathAsString);
    libraryPathAsString = getByPathAppendIfBlank(libraryPathAsString, oracleHome, Paths.get("lib"));
    return libraryPathAsString;
  }

  private String getLibraryPathByEnvironentIfBlank(String overwrittenLibraryPath) {
    if (StringUtils.isNotBlank(overwrittenLibraryPath) || SystemUtils.IS_OS_WINDOWS) {
      return overwrittenLibraryPath;
    }
    String environmentVariable = evaluateLibraryPathEnvironmentVariableByOperatingSystem();
    if (StringUtils.isBlank(environmentVariable)) {
      return null;
    }
    log.debug("Get the Value of the Environment Variable {}", environmentVariable);
    return System.getenv(environmentVariable);
  }

  private String evaluateLibraryPathEnvironmentVariableByOperatingSystem() {
    if (!SystemUtils.IS_OS_UNIX) {
      return null;
    }
    if (SystemUtils.IS_OS_MAC_OSX) {
      return "DYLD_LIBRARY_PATH";
    }
    if (SystemUtils.IS_OS_AIX) {
      return "LIBPATH";
    }
    if (SystemUtils.IS_OS_HP_UX) {
      return "SHLIB_PATH";
    }
    return "LD_LIBRARY_PATH";
  }

  private String getByPathAppendIfBlank(String value, Path originalPath, Path resolvablePath) {
    if (StringUtils.isNotBlank(value)) {
      return value;
    }
    return originalPath.resolve(resolvablePath).toAbsolutePath().toString();
  }

  private String evaluateNLSLang() {
    String nlsLang = getValueByOptionalArgumentOf(CommandLineOption.NLS);
    if (StringUtils.isBlank(nlsLang)) {
      nlsLang = System.getenv("NLS_LANG");
    }
    return nlsLang;
  }

  private void putIntoEnvironment(Map<String, String> environment, String key, Path path) {
    if (path == null) {
      return;
    }
    putIntoEnvironment(environment, key, path.toAbsolutePath().toString());
  }

  private void putIntoEnvironment(Map<String, String> environment, String key, String value) {
    if (StringUtils.isBlank(value)) {
      return;
    }
    log.debug("Put Property '{}' into the SQL*Plus Environment. Value: {}", key, value);
    environment.put(key, value);
  }

  @Override
  public String getSQLPlusConnect(String password) {
    String databaseConnect = getValueByArgumentOf(CommandLineOption.DB_CONNECT);
    String databaseUser = getValueByArgumentOf(CommandLineOption.DB_USER);

    if (StringUtils.isBlank(password)) {
      return databaseUser.toUpperCase() + "@" + databaseConnect;
    }
    return databaseUser.toUpperCase() + "/\"" + password + "\"@" + databaseConnect;
  }

  @Override
  public String getSQLPlusConnect() {
    return getSQLPlusConnect(null);
  }

  @Override
  public String getInstallSchemaConnect() {
    String databaseConnect = getValueByArgumentOf(CommandLineOption.DB_CONNECT);
    String installSchema = getValueByArgumentOf(CommandLineOption.DB_USER);
    if (isOptionSet(CommandLineOption.INSTALL_SCHEMA)) {
      installSchema = getValueByOptionalArgumentOf(CommandLineOption.INSTALL_SCHEMA);
    }
    return installSchema.toUpperCase() + "@" + databaseConnect;
  }

  @Override
  public boolean isQuiet() {
    return isOptionSet(CommandLineOption.QUIET);
  }

  @Override
  public boolean isPasswordAvailable() {
    return isOptionSet(CommandLineOption.DB_PASSWORD);
  }

  @Override
  public boolean isPasswordNotAvailable() {
    return !isPasswordAvailable();
  }

  @Override
  public String getPassword() {
    return getValueByOptionalArgumentOf(CommandLineOption.DB_PASSWORD);
  }

  @Override
  public UpgradeParameter getUpgradeParameter() {
    UpgradeParameter upgradeParameter = new UpgradeParameter();
    upgradeParameter.setApexApplication(getIntegerByOptionalArgumentOf(CommandLineOption.APEX_SOURCE_ID));
    upgradeParameter
        .setDatabaseChangeLogTableName(getValueByOptionalArgumentOf(CommandLineOption.CHANGELOG_TABLE_NAME));
    upgradeParameter
        .setDatabaseChangeLogLockTableName(getValueByOptionalArgumentOf(CommandLineOption.CHANGELOG_LOCK_TABLE_NAME));
    String liquibaseSchemaName = getValueByOptionalArgumentOf(CommandLineOption.CHANGELOG_SCHEMA);
    upgradeParameter.setLiquibaseSchemaName(liquibaseSchemaName);
    String installationSchema = getValueByOptionalArgumentOf(CommandLineOption.INSTALL_SCHEMA);
    upgradeParameter.setDefaultSchemaName(installationSchema);
    if (StringUtils.isNotBlank(installationSchema) && StringUtils.isBlank(liquibaseSchemaName)) {
      // Installation Schema has been set but not the Liquibase Schema
      // --> set the Liquibase Schema to the Installation Schema
      upgradeParameter.setLiquibaseSchemaName(liquibaseSchemaName);
    }
    upgradeParameter
        .setLiquibaseTablespaceName(getValueByOptionalArgumentOf(CommandLineOption.CHANGELOG_TABLESPACE_NAME));
    upgradeParameter.setDbUser(getValueByArgumentOf(CommandLineOption.DB_USER));
    upgradeParameter.setDbConnection(getValueByArgumentOf(CommandLineOption.DB_CONNECT));
    return upgradeParameter;
  }

  private Integer getIntegerByOptionalArgumentOf(CommandLineOption commandLineOption) {
    String optionalValue = getValueByOptionalArgumentOf(commandLineOption);
    if (StringUtils.isBlank(optionalValue)) {
      return null;
    }
    return Integer.parseInt(optionalValue);
  }

  @Override
  public ApexParameter getApexParameter() {
    ApexParameter apexParameter = new ApexParameter();
    apexParameter.setSourceId(getIntegerByOptionalArgumentOf(CommandLineOption.APEX_SOURCE_ID));
    apexParameter.setTargetId(getIntegerByOptionalArgumentOf(CommandLineOption.APEX_TARGET_ID));
    apexParameter.setKeepTargetOffset(isOptionSet(CommandLineOption.APEX_TARGET_KEEP_OFFSET));
    apexParameter.setOffset(getLongByOptionalArgumentOf(CommandLineOption.APEX_TARGET_OFFSET));
    apexParameter.setAlias(getValueByOptionalArgumentOf(CommandLineOption.APEX_TARGET_ALIAS));
    apexParameter.setName(getValueByOptionalArgumentOf(CommandLineOption.APEX_TARGET_NAME));
    apexParameter.setAutoInstallSupportingObjects(isOptionSet(CommandLineOption.APEX_TARGET_AUTO_INSTALL_SUP_OBJECT));
    apexParameter.setImagePrefix(getValueByOptionalArgumentOf(CommandLineOption.APEX_TARGET_IMAGE_PREFIX));
    apexParameter.setProxy(getValueByOptionalArgumentOf(CommandLineOption.APEX_TARGET_PROXY));
    apexParameter.setSchema(StringUtils.upperCase(getValueByOptionalArgumentOf(CommandLineOption.INSTALL_SCHEMA)));
    apexParameter.setWorkspace(getValueByOptionalArgumentOf(CommandLineOption.APEX_TARGET_WORKSPACE));
    apexParameter
        .setStaticAppFilePrefix(getValueByOptionalArgumentOf(CommandLineOption.APEX_TARGET_STATIC_APP_FILE_PREFIX));
    apexParameter.setStaticPluginFilePrefix(
        getValueByOptionalArgumentOf(CommandLineOption.APEX_TARGET_STATIC_PLUGIN_FILE_PREFIX));
    apexParameter
        .setStaticThemeFilePrefix(getValueByOptionalArgumentOf(CommandLineOption.APEX_TARGET_STATIC_THEME_FILE_PREFIX));
    return apexParameter;
  }

  private Long getLongByOptionalArgumentOf(CommandLineOption commandLineOption) {
    String optionalValue = getValueByOptionalArgumentOf(commandLineOption);
    if (StringUtils.isBlank(optionalValue)) {
      return null;
    }
    return Long.parseLong(optionalValue);
  }

  @Override
  public boolean isInstallInOtherSchema() {
    String installSchema = getValueByOptionalArgumentOf(CommandLineOption.INSTALL_SCHEMA);
    return !validateLogonSchemaEquals(installSchema);
  }

  private boolean validateLogonSchemaEquals(String otherSchema) {
    if (StringUtils.isBlank(otherSchema)) {
      return true;
    }
    String logonSchema = getValueByArgumentOf(CommandLineOption.DB_USER);
    return logonSchema.equalsIgnoreCase(otherSchema);
  }

  @Override
  public boolean isChangeLogInOtherSchema() {
    String changeLogSchema = getValueByOptionalArgumentOf(CommandLineOption.CHANGELOG_SCHEMA);
    return !validateLogonSchemaEquals(changeLogSchema);
  }

  @Override
  public Writer getOutputFile(Writer consoleWriter) {
    if (isOutputToConsole()) {
      return consoleWriter;
    }
    String outputLocation = getValueByOptionalArgumentOf(CommandLineOption.OUTPUT_LOCATION);
    File outputFile = new File(outputLocation);
    try {
      if (!outputFile.exists()) {
        return new FileWriter(outputFile);
      }
      checkOutputFile(outputFile);
      return new FileWriter(outputFile);
    } catch (IOException e) {
      throw new InstallApexException(Reason.CREATE_FILE_ERROR, e, outputFile.getAbsolutePath(),
          commandType.getLongOption("--"), e.getMessage());
    }
  }

  @Override
  public boolean isOutputToConsole() {
    String outputLocation = getValueByOptionalArgumentOf(CommandLineOption.OUTPUT_LOCATION);
    return StringUtils.isBlank(outputLocation) || "-".equals(outputLocation);
  }

  private void checkOutputFile(File outputFile) {
    if (outputFile.isDirectory()) {
      throw new InstallApexException(Reason.EXISTING_OUTPUT_IS_DIRECTORY, outputFile.getAbsolutePath());
    }
    if (isOptionNotSet(CommandLineOption.FORCE)) {
      throw new InstallApexException(Reason.CANNOT_OVERWRITE_OUTPUT_FILE_WITHOUT_FORCE_FLAG,
          outputFile.getAbsolutePath(), CommandLineOption.FORCE.getLongOption("--"));
    }
  }

  @Override
  public Path getOutputDirectory() {
    String outputLocation = getValueByOptionalArgumentOf(CommandLineOption.OUTPUT_LOCATION);
    if (StringUtils.isBlank(outputLocation)) {
      return Paths.get(".");
    }
    File outputDirectory = new File(outputLocation);
    if (!outputDirectory.exists()) {
      outputDirectory.mkdirs();
    }
    if (!outputDirectory.isDirectory()) {
      throw new InstallApexException(Reason.EXISTING_OUTPUT_IS_FILE, outputDirectory.getAbsolutePath());
    }
    return outputDirectory.toPath();
  }

}

package io.github.mufasa1976.installApex.command.settings;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.Writer;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.ParseException;
import org.apache.velocity.app.VelocityEngine;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.core.env.Environment;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.testng.Assert;
import org.testng.annotations.Test;

import io.github.mufasa1976.installApex.cli.CommandLineOption;
import io.github.mufasa1976.installApex.command.CommandType;
import io.github.mufasa1976.installApex.config.TestApplicationConfiguration;
import io.github.mufasa1976.installApex.exception.NoDirectoryException;

@ContextConfiguration(classes = TestApplicationConfiguration.class)
public class TestCommandLineCommandSettingsAdapter extends AbstractTestNGSpringContextTests {

  private static final Logger log = LoggerFactory.getLogger(TestCommandLineCommandSettingsAdapter.class);

  private final static int SQLPLUS_EXIT_SUCCESS = 0;
  private final static int SQLPLUS_EXIT_FAILURE = 1;

  @Autowired
  private CommandLineParser parser;

  @Autowired
  private MessageSource messageSource;

  @Autowired
  private Environment environment;

  @Autowired
  private VelocityEngine velocityEngine;

  @Autowired
  private ResourceLoader resourceLoader;

  @Value("${testCommandLineCommandSettingsAdapter.username}")
  private String username;

  @Value("${testCommandLineCommandSettingsAdapter.password}")
  private String password;

  @Value("${testCommandLineCommandSettingsAdapter.sqlplus.scriptName}")
  private String sqlplusScriptName;

  @Value("${testCommandLineCommandSettingsAdapter.sqlplus.scriptEncoding}")
  private String sqlplusScriptEncoding;

  @Value("classpath:/tns_admin")
  private Resource tnsAdmin;

  @Test
  public void testGetExistingTemporaryPath() {
    Path expectedPath = Paths.get(".");
    //@formatter:off
    CommandSettings commandSettings = createCommandLine(
        CommandLineOption.EXTRACT_DDL.getLongOption("--"),
        CommandLineOption.TEMP_DIRECTORY.getLongOption("--"),
        expectedPath.toString());
    //@formatter:on
    Path actualPath = commandSettings.getTemporaryDirectory(false);
    Assert.assertEquals(actualPath.toAbsolutePath(), expectedPath.toAbsolutePath());
  }

  private CommandSettings createCommandLine(String... arguments) {
    try {
      CommandLine commandLine = parser.parse(CommandLineOption.getOptions(messageSource), arguments);
      CommandType commandType = evaluateCommandType(commandLine);
      return new CommandLineCommandSettingsAdapter(commandType, commandLine);
    } catch (ParseException e) {
      throw new IllegalArgumentException(String.format("Unparsable CommandLine: %s", Arrays.toString(arguments)), e);
    }
  }

  private CommandType evaluateCommandType(CommandLine commandLine) {
    for (CommandLineOption option : CommandLineOption.getCommandOptions()) {
      if (option.isAvailableOn(commandLine)) {
        return option.getCommandType();
      }
    }
    return null;
  }

  @Test
  public void testCreateNewTemporaryPath() {
    Path expectedPath = Paths.get("newPath");
    //@formatter:off
    CommandSettings commandSettings = createCommandLine(
        CommandLineOption.EXTRACT_DDL.getLongOption("--"),
        CommandLineOption.TEMP_DIRECTORY.getLongOption("--"),
        expectedPath.toString());
    //@formatter:on
    Path actualPath = commandSettings.getTemporaryDirectory(true);
    Assert.assertEquals(actualPath.toAbsolutePath(), expectedPath.toAbsolutePath());
  }

  @Test(expectedExceptions = IllegalStateException.class)
  public void testgetNonExistingTemporaryPath() {
    Path expectedPath = Paths.get("newPath2");
    //@formatter:off
    CommandSettings commandSettings = createCommandLine(
        CommandLineOption.EXTRACT_DDL.getLongOption("--"),
        CommandLineOption.TEMP_DIRECTORY.getLongOption("--"),
        expectedPath.toString());
    //@formatter:on
    commandSettings.getTemporaryDirectory(false);
  }

  @Test
  public void testConnectToOracleWithTNSKeyValue() throws SQLException, IOException {
    String connect = environment.getRequiredProperty("testCommandLineCommandSettingsAdapter.connect.TNS.KeyValue");
    testConnectToOracle(connect);
  }

  private void testConnectToOracle(String connect) throws SQLException, IOException {
    testConnectToOracle(connect, password, tnsAdmin.getFile());
  }

  private void testConnectToOracle(String connect, String password, File tnsAdmin) throws SQLException {
    CommandSettings commandSettings;
    if (tnsAdmin == null) {
      //@formatter:off
      commandSettings = createCommandLine(
          CommandLineOption.EXTRACT_DDL.getLongOption("--"),
          CommandLineOption.DB_USER.getLongOption("--"),
          username,
          CommandLineOption.DB_CONNECT.getLongOption("--"),
          connect);
      //@formatter:on
    } else {
      //@formatter:off
      commandSettings = createCommandLine(
          CommandLineOption.EXTRACT_DDL.getLongOption("--"),
          CommandLineOption.DB_USER.getLongOption("--"),
          username,
          CommandLineOption.DB_CONNECT.getLongOption("--"),
          connect,
          CommandLineOption.TNS_ADMIN.getLongOption("--"),
          tnsAdmin.getAbsolutePath());
      //@formatter:on
    }
    DataSource dataSource = commandSettings.getDataSource(password);
    Assert.assertNotNull(dataSource);
    try (Connection connection = dataSource.getConnection()) {
      log.debug("connected");
    }
  }

  @Test
  public void testConnectToOracleWithTNSAliasXEAndTestTNSAdmin() throws SQLException, IOException {
    String connect = environment.getRequiredProperty("testCommandLineCommandSettingsAdapter.connect.TNS.Alias.XETEST");
    testConnectToOracle(connect);
  }

  @Test
  public void testConnectToOracleWithTNSAliasLocalhostAndSystemTNSAdmin() throws SQLException, IOException {
    String connect = environment
        .getRequiredProperty("testCommandLineCommandSettingsAdapter.connect.TNS.Alias.LOCALHOST");
    testConnectToOracle(connect, (Resource) null);
  }

  @Test(expectedExceptions = SQLException.class)
  public void testConnectToOracleWithTNSAliasXEAndSystemTNSAdmin() throws SQLException, IOException {
    String connect = environment.getRequiredProperty("testCommandLineCommandSettingsAdapter.connect.TNS.Alias.XETEST");
    testConnectToOracle(connect, (Resource) null);
  }

  @Test(expectedExceptions = NoDirectoryException.class)
  public void testConnectToOracleWithTNSAliasIsAFile() throws SQLException, IOException {
    String connect = environment.getRequiredProperty("testCommandLineCommandSettingsAdapter.connect.TNS.Alias.XETEST");
    Resource resource = resourceLoader.getResource("classpath:/test_application.properties");
    testConnectToOracle(connect, resource);
  }

  private void testConnectToOracle(String connect, Resource tnsAlias) throws SQLException, IOException {
    testConnectToOracle(connect, password, tnsAlias != null ? tnsAlias.getFile() : null);
  }

  @Test(expectedExceptions = SQLException.class)
  public void testConnectToOracleWithTNSAliasToWrongDirectory() throws SQLException, IOException {
    Resource resource = resourceLoader.getResource("classpath:/");
    testConnectToOracle("wrongPath", resource);
  }

  @Test(expectedExceptions = SQLException.class)
  public void testConnectToOracleWithWrongTNSAlias() throws SQLException, IOException {
    testConnectToOracle("wrongTNS");
  }

  @Test
  public void testSYSDBAConnect() throws SQLException {
    if (!environment.containsProperty("testCommandLineCommandSettingsAdapter.sydbaPassword")) {
      System.err.println(
          "Test would not run due to missing Property \"testCommandLineCommandSettingsAdapter.sydbaPassword\"");
      return;
    }

    String sysdbaPassword = environment.getProperty("testCommandLineCommandSettingsAdapter.sydbaPassword");
    String connect = environment.getRequiredProperty("testCommandLineCommandSettingsAdapter.connect.TNS.KeyValue");
    //@formatter:off
    CommandSettings commandSettings = createCommandLine(
        CommandLineOption.EXTRACT_DDL.getLongOption("--"),
        CommandLineOption.DB_USER.getLongOption("--"),
        "SYS",
        CommandLineOption.DB_CONNECT.getLongOption("--"),
        connect,
        CommandLineOption.SYSDBA.getLongOption("--"));
    //@formatter:on
    DataSource dataSource = commandSettings.getDataSource(sysdbaPassword);
    Assert.assertNotNull(dataSource);
    try (Connection connection = dataSource.getConnection()) {
      log.debug("connected");
    }
  }

  @Test(expectedExceptions = SQLException.class)
  public void testFailedConnectToOracle() throws SQLException, IOException {
    String connect = "failedConnection";
    testConnectToOracle(connect);
  }

  @Test(expectedExceptions = SQLException.class)
  public void testWrongPasswordConnectToOracle() throws SQLException {
    String connect = environment.getRequiredProperty("testCommandLineCommandSettingsAdapter.connect.TNS.KeyValue");
    testConnectToOracle(connect, "wrongPassword");
  }

  private void testConnectToOracle(String connect, String password) throws SQLException {
    testConnectToOracle(connect, password, null);
  }

  @Test
  public void testConnectionToOracleWithThinService() throws SQLException, IOException {
    String connect = environment.getRequiredProperty("testCommandLineCommandSettingsAdapter.connect.thin.service");
    testConnectToOracle(connect);
  }

  @Test
  public void testConnectionToOracleWithThinSID() throws SQLException, IOException {
    String connect = environment.getRequiredProperty("testCommandLineCommandSettingsAdapter.connect.thin.sid");
    testConnectToOracle(connect);
  }

  @Test
  public void testSQLPlusWithTNSKeyValue() throws IOException, InterruptedException {
    String connect = environment.getRequiredProperty("testCommandLineCommandSettingsAdapter.connect.TNS.KeyValue");
    testSQLPlus(connect, SQLPLUS_EXIT_SUCCESS);
  }

  private void testSQLPlus(String connect, int expectedExitStatus) throws IOException, InterruptedException {
    testSQLPlus(connect, expectedExitStatus, tnsAdmin.getFile());
  }

  private void testSQLPlus(String connect, int expectedExitStatus, File tnsAdmin)
      throws IOException, InterruptedException {
    CommandSettings commandSettings;
    if (tnsAdmin == null) {
      //@formatter:off
      commandSettings = createCommandLine(
          CommandLineOption.EXTRACT_DDL.getLongOption("--"),
          CommandLineOption.DB_USER.getLongOption("--"),
          username,
          CommandLineOption.DB_CONNECT.getLongOption("--"),
          connect);
      //@formatter:on
    } else {
      //@formatter:off
      commandSettings = createCommandLine(
          CommandLineOption.EXTRACT_DDL.getLongOption("--"),
          CommandLineOption.DB_USER.getLongOption("--"),
          username,
          CommandLineOption.DB_CONNECT.getLongOption("--"),
          connect,
          CommandLineOption.TNS_ADMIN.getLongOption("--"),
          tnsAdmin.getAbsolutePath());
      //@formatter:on
    }
    Map<String, Object> context = prepareContext(commandSettings);

    ProcessBuilder sqlplusBuilder = commandSettings.getSQLPlusCommand();
    Assert.assertNotNull(sqlplusBuilder);

    Process sqlplus = sqlplusBuilder.start();
    redirectStandardInputToScript(sqlplus.getOutputStream(), context);
    redirectStream(sqlplus.getInputStream(), System.out);
    redirectStream(sqlplus.getErrorStream(), System.out);

    sqlplus.waitFor();
    Assert.assertEquals(sqlplus.exitValue(), expectedExitStatus);
  }

  private Map<String, Object> prepareContext(CommandSettings commandSettings) {
    Map<String, Object> context = new HashMap<>();
    context.put("sqlPlusConnect", commandSettings.buildSQLPlusConnect(password));
    return context;
  }

  private void redirectStandardInputToScript(OutputStream outputStream, Map<String, Object> context)
      throws IOException {
    try (Writer output = new PrintWriter(outputStream)) {
      VelocityEngineUtils.mergeTemplate(velocityEngine, sqlplusScriptName, sqlplusScriptEncoding, context, output);
    }
  }

  private void redirectStream(InputStream inputStream, PrintStream outputStream) throws IOException {
    try (BufferedReader input = new BufferedReader(new InputStreamReader(inputStream))) {
      for (String line = null; (line = input.readLine()) != null;) {
        outputStream.println(line);
      }
    }
  }

  @Test
  public void testSQLPlusWithTNSAliasLocalhostAndTestTNSAdmin() throws IOException, InterruptedException {
    String connect = environment
        .getRequiredProperty("testCommandLineCommandSettingsAdapter.connect.TNS.Alias.LOCALHOST");
    testSQLPlus(connect, SQLPLUS_EXIT_SUCCESS);
  }

  @Test
  public void testSQLPlusWithTNSAliasLocalhostAndSystemTNSAdmin() throws IOException, InterruptedException {
    String connect = environment
        .getRequiredProperty("testCommandLineCommandSettingsAdapter.connect.TNS.Alias.LOCALHOST");
    testSQLPlus(connect, SQLPLUS_EXIT_SUCCESS, null);
  }

  @Test
  public void testSQLPlusWithTNSAliasXEAndTestTNSAdmin() throws IOException, InterruptedException {
    String connect = environment.getRequiredProperty("testCommandLineCommandSettingsAdapter.connect.TNS.Alias.XETEST");
    testSQLPlus(connect, SQLPLUS_EXIT_SUCCESS);
  }

  @Test
  public void testSQLPlusWithTNSAliasXEAndSystemTNSAdmin() throws IOException, InterruptedException {
    String connect = environment.getRequiredProperty("testCommandLineCommandSettingsAdapter.connect.TNS.Alias.XETEST");
    testSQLPlus(connect, SQLPLUS_EXIT_FAILURE, null);
  }

  @Test
  public void testSQLPlusWithThinService() throws IOException, InterruptedException {
    String connect = environment.getRequiredProperty("testCommandLineCommandSettingsAdapter.connect.thin.service");
    testSQLPlus(connect, SQLPLUS_EXIT_SUCCESS);
  }

  @Test
  public void testSQLPlusWithThinSID() throws IOException, InterruptedException {
    String connect = environment.getRequiredProperty("testCommandLineCommandSettingsAdapter.connect.thin.sid");
    testSQLPlus(connect, SQLPLUS_EXIT_FAILURE);
  }

  @Test
  public void testForceTrue() {
    //@formatter:off
    CommandSettings commandSettings = createCommandLine(
        CommandLineOption.EXTRACT_DDL.getLongOption("--"),
        CommandLineOption.FORCE.getLongOption("--"));
    //@formatter:on
    Assert.assertTrue(commandSettings.isForce());
  }

  @Test
  public void testForceFalse() {
    CommandSettings commandSettings = createCommandLine(CommandLineOption.EXTRACT_DDL.getLongOption("--"));
    Assert.assertFalse(commandSettings.isForce());
  }

  @Test
  public void testQuietTrue() {
    //@formatter:off
    CommandSettings commandSettings = createCommandLine(
        CommandLineOption.EXTRACT_DDL.getLongOption("--"),
        CommandLineOption.QUIET.getLongOption("--"));
    //@formatter:on
    Assert.assertTrue(commandSettings.isQuiet());
  }

  @Test
  public void testQuietFalse() {
    CommandSettings commandSettings = createCommandLine(CommandLineOption.EXTRACT_DDL.getLongOption("--"));
    Assert.assertFalse(commandSettings.isQuiet());
  }

  @Test
  public void testApexIdNumeric() {
    //@formatter:off
    CommandSettings commandSettings = createCommandLine(
        CommandLineOption.EXTRACT_APEX.getLongOption("--"),
        CommandLineOption.APEX_SOURCE_ID.getLongOption("--"),
        "100");
    //@formatter:on
    Assert.assertTrue(commandSettings.isApexIdAvailable());
    Assert.assertEquals(commandSettings.getApexId(), new Integer(100));
  }

}

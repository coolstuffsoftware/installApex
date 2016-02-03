package io.github.mufasa1976.installApex.command.database;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.OperationNotSupportedException;
import javax.sql.DataSource;

import org.apache.commons.lang.StringUtils;
import org.mockito.Matchers;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.testng.Assert;
import org.testng.annotations.Test;

import io.github.mufasa1976.installApex.command.CommandType;
import io.github.mufasa1976.installApex.command.settings.CommandSettings;
import io.github.mufasa1976.installApex.config.TestApplicationConfiguration;
import io.github.mufasa1976.installApex.exception.DataSourceCreationException;
import jline.console.ConsoleReader;

@ContextConfiguration(classes = TestApplicationConfiguration.class)
public class TestAbstractDataSourceCommand extends AbstractTestNGSpringContextTests {

  @Autowired
  private DataSource dataSource;

  @Autowired
  private AutowiredAnnotationBeanPostProcessor beanPostProcessor;

  @Test
  public void testConnectPasswordByCommandLine() throws IOException, SQLException {
    AbstractDataSourceCommand command = createDataSourceCommand("passwordCLI");
    ConsoleReader consoleReader = createAndInjectConsoleReader(command, null);
    try (Connection connection = command.getConnection()) {
      Assert.assertNotNull(connection);
    }
    Mockito.verify(consoleReader, Mockito.times(0)).readLine(Matchers.anyString(), Matchers.anyChar());
  }

  @Test
  public void testConnectPasswordByConsole() throws IOException, SQLException {
    AbstractDataSourceCommand command = createDataSourceCommand(null);
    ConsoleReader consoleReader = createAndInjectConsoleReader(command, "passwordConsole");
    try (Connection connection = command.getConnection()) {
      Assert.assertNotNull(connection);
    }
    Mockito.verify(consoleReader, Mockito.times(1)).readLine(Matchers.anyString(), Matchers.anyChar());
  }

  @Test(expectedExceptions = DataSourceCreationException.class)
  public void testNoPassword() throws IOException, SQLException {
    AbstractDataSourceCommand command = createDataSourceCommand(null);
    createAndInjectConsoleReader(command, null);
    try (Connection connection = command.getConnection()) {
      Assert.assertNotNull(connection);
    }
  }

  private ConsoleReader createAndInjectConsoleReader(AbstractDataSourceCommand command, String password)
      throws IOException {
    ConsoleReader consoleReader = Mockito.mock(ConsoleReader.class);
    Mockito.when(consoleReader.readLine(Matchers.anyString(), Matchers.anyChar())).thenReturn(password);
    command.setConsoleReader(consoleReader);
    return consoleReader;
  }

  @SuppressWarnings("unchecked")
  private AbstractDataSourceCommand createDataSourceCommand(String passwordAsCLIArgument) throws IOException {
    final CommandSettings settings = Mockito.mock(CommandSettings.class);
    Mockito.when(settings.getDataSource(Matchers.anyString())).thenReturn(dataSource);
    Mockito.when(settings.getDataSource(null)).thenThrow(DataSourceCreationException.class);
    Mockito.when(settings.isPasswordAvailable()).thenReturn(StringUtils.isNotBlank(passwordAsCLIArgument));
    Mockito.when(settings.isPasswordNotAvailable()).thenReturn(StringUtils.isBlank(passwordAsCLIArgument));
    Mockito.when(settings.getPassword()).thenReturn(passwordAsCLIArgument);

    AbstractDataSourceCommand command = new AbstractDataSourceCommand() {

      @Override
      public void execute() throws OperationNotSupportedException {}

      @Override
      protected CommandType getCommandType() {
        return null;
      }

      @Override
      protected CommandSettings getSettings() {
        return settings;
      }

    };
    beanPostProcessor.processInjection(command);

    return command;
  }
}

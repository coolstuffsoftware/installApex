package io.github.mufasa1976.installApex.command.database;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Locale;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;

import io.github.mufasa1976.installApex.command.AbstractCommand;
import io.github.mufasa1976.installApex.exception.ConnectionCreationException;
import jline.console.ConsoleReader;

public abstract class AbstractDataSourceCommand extends AbstractCommand {

  private static final Logger log = LoggerFactory.getLogger(AbstractDataSourceCommand.class);

  private static final String PASSWORD_PROMPT = "abstractDataSourceCommand.passwordPrompt";

  private ConsoleReader consoleReader;

  @Autowired
  private MessageSource messageSource;

  protected Connection getConnection() {
    try {
      String password = evaluatePassword();
      DataSource dataSource = getSettings().getDataSource(password);
      return dataSource.getConnection();
    } catch (IOException | SQLException e) {
      throw new ConnectionCreationException(e);
    }
  }

  private String evaluatePassword() throws IOException {
    if (getSettings().isPasswordNotAvailable()) {
      return readPasswordFromConsole();
    }
    return getSettings().getPassword();
  }

  private String readPasswordFromConsole() throws IOException {
    String passwordPrompt = messageSource.getMessage(PASSWORD_PROMPT, null, PASSWORD_PROMPT, Locale.getDefault());
    log.debug("Read the Password from the Console");
    return consoleReader.readLine(passwordPrompt, '*');
  }

  @Autowired
  void setConsoleReader(ConsoleReader consoleReader) {
    this.consoleReader = consoleReader;
  }

}

package software.coolstuff.installapex.command;

import java.io.IOException;
import java.util.Locale;

import javax.naming.OperationNotSupportedException;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.jdbc.datasource.DelegatingDataSource;

import jline.console.ConsoleReader;
import software.coolstuff.installapex.exception.InstallApexException;
import software.coolstuff.installapex.exception.InstallApexException.Reason;

public abstract class AbstractDataSourceCommand extends AbstractCommand {

  private static final String KEY_PASSWORD_PROMPT = "abstractCommand.passwordPrompt";

  @Autowired
  private DelegatingDataSource delegatingDataSource;

  @Autowired
  private MessageSource messageSource;

  @Autowired
  private ConsoleReader consoleReader;

  private String password;

  @Override
  public final void execute() throws OperationNotSupportedException {
    getPassword();
    setTargetDataSource();
    executeWithInitializedDataSource();
  }

  private void getPassword() {
    password = getSettings().getPassword();
    if (getSettings().isPasswordNotAvailable()) {
      password = readDatabasePasswordFromConsole();
    }
  }

  protected String readDatabasePasswordFromConsole() {
    try {
      String databaseConnect = getSettings().getSQLPlusConnect();
      String passwordPrompt = messageSource.getMessage(KEY_PASSWORD_PROMPT, new String[] { databaseConnect },
          Locale.getDefault());
      return consoleReader.readLine(passwordPrompt, '*');
    } catch (IOException e) {
      throw new InstallApexException(Reason.CONSOLE_PROBLEM, e).setPrintStrackTrace(true);
    }
  }

  private void setTargetDataSource() {
    DataSource dataSource = getSettings().getDataSource(password);
    delegatingDataSource.setTargetDataSource(dataSource);
  }

  protected abstract void executeWithInitializedDataSource() throws OperationNotSupportedException;

  protected String getSQLPlusConnect() {
    return getSettings().getSQLPlusConnect(password);
  }

}

package software.coolstuff.installapex.command;

import java.io.IOException;
import java.util.Locale;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.MessageSource;
import org.springframework.jdbc.datasource.DelegatingDataSource;

import jline.console.ConsoleReader;
import software.coolstuff.installapex.cli.CommandLineOption;
import software.coolstuff.installapex.exception.InstallApexException;
import software.coolstuff.installapex.exception.InstallApexException.Reason;

public abstract class AbstractDataSourceCommand extends AbstractCommand {

  private static final String KEY_PASSWORD_PROMPT = "abstractDataSourceCommand.passwordPrompt";

  @Autowired
  private DelegatingDataSource delegatingDataSource;

  @Autowired
  private MessageSource messageSource;

  @Autowired
  @Qualifier("error")
  private ConsoleReader errorConsole;

  private String password;

  @Override
  public final void execute() {
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
      if (getSettings().isQuiet()) {
        throw new InstallApexException(Reason.CANNOT_QUIETLY_READ_PASSWORD_FROM_CONSOLE,
            CommandLineOption.DB_PASSWORD.getLongOption("--"), CommandLineOption.QUIET.getLongOption("--"));
      }
      String databaseConnect = getSettings().getSQLPlusConnect();
      String passwordPrompt = messageSource.getMessage(KEY_PASSWORD_PROMPT, new String[] { databaseConnect },
          Locale.getDefault());
      return errorConsole.readLine(passwordPrompt, '*');
    } catch (IOException e) {
      throw new InstallApexException(Reason.CONSOLE_PROBLEM, e).setPrintStrackTrace(true);
    }
  }

  private void setTargetDataSource() {
    DataSource dataSource = getSettings().getDataSource(password);
    delegatingDataSource.setTargetDataSource(dataSource);
  }

  protected abstract void executeWithInitializedDataSource();

  protected String getSQLPlusConnect() {
    return getSettings().getSQLPlusConnect(password);
  }

}

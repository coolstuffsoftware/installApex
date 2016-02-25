package software.coolstuff.installapex.command;

import java.io.IOException;
import java.util.Locale;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.MessageSource;
import org.springframework.jdbc.datasource.DelegatingDataSource;

import jline.console.ConsoleReader;
import software.coolstuff.installapex.cli.CommandLineOption;
import software.coolstuff.installapex.exception.InstallApexException;
import software.coolstuff.installapex.exception.InstallApexException.Reason;

public abstract class AbstractDataSourceCommand extends AbstractCommand {

  private static final Logger LOG = LoggerFactory.getLogger(AbstractDataSourceCommand.class);

  private static final String KEY_PASSWORD_PROMPT = "abstractDataSourceCommand.passwordPrompt";

  @Autowired
  private DelegatingDataSource delegatingDataSource;

  @Autowired
  private MessageSource messageSource;

  @Autowired
  @Qualifier("standard")
  private ConsoleReader standardConsole;

  private String password;

  @Override
  public final void execute() {
    getPasswordFrom(getInputConsole());
    setTargetDataSource();
    executeWithInitializedDataSource();
  }

  protected ConsoleReader getInputConsole() {
    return standardConsole;
  }

  private void getPasswordFrom(ConsoleReader console) {
    LOG.debug("Try to get the Password from the CommandLine Argument");
    password = getSettings().getPassword();
    if (getSettings().isPasswordNotAvailable()) {
      password = readDatabasePasswordFrom(console);
    }
  }

  private String readDatabasePasswordFrom(ConsoleReader console) {
    try {
      if (getSettings().isQuiet()) {
        throw new InstallApexException(Reason.CANNOT_QUIETLY_READ_PASSWORD_FROM_CONSOLE,
            CommandLineOption.DB_PASSWORD.getLongOption("--"), CommandLineOption.QUIET.getLongOption("--"));
      }
      LOG.debug("Get the Database User and Connect from the CommandLine Arguments");
      String databaseConnect = getSettings().getSQLPlusConnect();
      String passwordPrompt = messageSource.getMessage(KEY_PASSWORD_PROMPT, new String[] { databaseConnect },
          Locale.getDefault());
      LOG.debug("Prompt for Password and get it from the Console");
      print(passwordPrompt);
      return console.readLine('*');
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

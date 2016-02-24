package software.coolstuff.installapex.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.annotation.PostConstruct;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.MessageSource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

import jline.Terminal;
import jline.console.ConsoleReader;
import software.coolstuff.installapex.cli.CommandLineOption;
import software.coolstuff.installapex.command.settings.CommandSettings;
import software.coolstuff.installapex.exception.InstallApexException;
import software.coolstuff.installapex.exception.InstallApexException.Reason;
import software.coolstuff.installapex.service.apex.ApexParameter;
import software.coolstuff.installapex.service.apex.parser.ApexApplication;
import software.coolstuff.installapex.service.apex.parser.ApexApplicationParserService;

public abstract class AbstractCommand implements Command {

  private static final Logger LOG = LoggerFactory.getLogger(AbstractCommand.class);

  @Autowired
  private CommandRegistryImpl commandRegistry;

  @Autowired
  private ResourceLoader resourceLoader;

  @Autowired
  private MessageSource messageSource;

  @Autowired
  @Qualifier("standard")
  private ConsoleReader console;

  @Autowired
  private ApexApplicationParserService apexApplicationParserService;

  private PrintWriter printWriter;

  private CommandSettings commandSettings;

  @PostConstruct
  protected void init() {
    LOG.debug("Register CommandType {} with Class {} as a Service", this.getCommandType(),
        this.getClass().getSimpleName());
    commandRegistry.register(this);
    LOG.debug("Set the ConsolePrinter");
    printWriter = new PrintWriter(console.getOutput());
  }

  protected abstract CommandType getCommandType();

  protected CommandSettings getSettings() {
    return commandSettings;
  }

  protected Resource getResource(String location) {
    return resourceLoader.getResource(location);
  }

  protected void printMessage(String messageKey, Object... arguments) {
    if (getSettings().isQuiet()) {
      return;
    }
    String message = messageSource.getMessage(messageKey, arguments, Locale.getDefault());
    internalPrint(message);
  }

  protected void printlnMessage(String messageKey, Object... arguments) {
    if (getSettings().isQuiet()) {
      return;
    }
    String message = messageSource.getMessage(messageKey, arguments, Locale.getDefault());
    internalPrintln(message);
  }

  protected void print(Object message) {
    if (getSettings().isQuiet()) {
      return;
    }
    internalPrint(message);
  }

  private void internalPrint(Object message) {
    try {
      console.print(message != null ? message.toString() : "null");
      console.flush();
    } catch (IOException e) {
      throw new InstallApexException(Reason.CONSOLE_PROBLEM, e).setPrintStrackTrace(true);
    }
  }

  protected void println(Object message) {
    if (getSettings().isQuiet()) {
      return;
    }
    internalPrintln(message);
  }

  private void internalPrintln(Object message) {
    try {
      console.println(message != null ? message.toString() : "null");
      console.flush();
    } catch (IOException e) {
      throw new InstallApexException(Reason.CONSOLE_PROBLEM, e).setPrintStrackTrace(true);
    }
  }

  protected int getTerminalWidth() {
    Terminal terminal = console.getTerminal();
    return terminal.getWidth();
  }

  protected int getTerminalHeight() {
    Terminal terminal = console.getTerminal();
    return terminal.getHeight();
  }

  protected PrintWriter getPrintWriter() {
    return printWriter;
  }

  void setCommandSettings(CommandSettings commandSettings) {
    this.commandSettings = commandSettings;
  }

  @Override
  public String toString() {
    return this.getClass().getName() + " {commandType: \"" + getCommandType() + "\"}";
  }

  protected ApexApplication getInstallationCandidate() {
    LOG.debug("Get Installation Candidates by parsing all packaged APEX Applications");
    List<ApexApplication> candidates = apexApplicationParserService.getCandidates();
    checkEmptyCandidateList(candidates);
    ApexParameter apexParameter = getSettings().getApexParameter();
    Integer requestedApplicationId = apexParameter.getSourceId();
    if (requestedApplicationId == null) {
      return getSingleApexApplication(candidates);
    }
    return findCandidate(candidates, requestedApplicationId);
  }

  private void checkEmptyCandidateList(List<ApexApplication> candidates) {
    if (CollectionUtils.isEmpty(candidates)) {
      throw new InstallApexException(Reason.NO_APEX_APPLICATIONS_INCLUDED,
          apexApplicationParserService.getDefaultLocation());
    }
  }

  protected ApexApplication getSingleApexApplication(List<ApexApplication> candidates) {
    if (candidates.size() == 1) {
      LOG.debug("Only 1 APEX Application has been packaged: {}", candidates.get(0));
      return candidates.get(0);
    }
    throw new InstallApexException(Reason.CLI_MISSING_REQUIRED_OPTION,
        CommandLineOption.APEX_SOURCE_ID.getLongOption("--"), getCommandType().getLongOption("--"));
  }

  private ApexApplication findCandidate(List<ApexApplication> candidates, Integer requestedApplicationId) {
    for (ApexApplication candidate : candidates) {
      if (candidate.getId() == requestedApplicationId) {
        LOG.debug("Requested APEX Application with ID {} has been packaged: {}", requestedApplicationId, candidate);
        return candidate;
      }
    }
    throw new InstallApexException(Reason.REQUESTED_APEX_ID_NOT_AVAILABLE, requestedApplicationId);
  }

}

package io.github.mufasa1976.installApex.cli;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.OptionBuilder;
import org.apache.commons.cli.OptionGroup;
import org.apache.commons.cli.Options;
import org.apache.commons.lang.StringUtils;
import org.springframework.context.MessageSource;

import io.github.mufasa1976.installApex.command.CommandType;

public enum CommandLineOption {

  HELP(new Settings(CommandType.HELP, '?')),
  FORCE(new Settings("force", 'f')),
  QUIET(new Settings("quiet", 'q')),

  LIST(new Settings(CommandType.LIST, 'l')),
  INSTALL(new Settings(CommandType.INSTALL)),
  EXTRACT_DDL(new Settings(CommandType.EXTRACT_DDL)),
  EXTRACT_APEX(new Settings(CommandType.EXTRACT_APEX)),
  TEST(new Settings(CommandType.TEST, 't')),

  DB_USER(new Settings("dbUser", 'u').setArgument("User")),
  DB_PASSWORD(new Settings("dbPassword", 'p').setArgument("Password")),
  DB_CONNECT(new Settings("dbConnect", 'c').setArgument("TNS-Connect")),
  SYSDBA(new Settings("asSysdba")),

  ORACLE_HOME(new Settings("oracleHome", 'o').setArgument("Directory")),
  TNS_ADMIN(new Settings("tnsAdmin").setArgument("TNS-Admin")),
  SQLPLUS_EXECUTABLE(new Settings("sqlplusExecutable").setArgument("File")),
  LIBPATH(new Settings("libraryPath", 'l').setArgument("Directory")),
  NLS(new Settings("nlsLang").setArgument("NLS_LANG")),
  INSTALL_SCHEMA(new Settings("installSchema", 's')),

  CHANGELOG_SCHEMA(new Settings("changeLogSchemaName")),
  CHANGELOG_TABLE_NAME(new Settings("changeLogTableName")),
  CHANGELOG_LOCK_TABLE_NAME(new Settings("changeLogLockTableName")),
  CHANGELOG_TABLESPACE_NAME(new Settings("changeLogTablespaceName")),

  APEX_SOURCE_ID(new Settings("sourceId").setArgument("ID")),
  APEX_TARGET_ID(new Settings("targetId").setArgument("ID")),
  APEX_TARGET_ALIAS(new Settings("targetAlias").setArgument("Alias")),
  APEX_TARGET_NAME(new Settings("targetName").setArgument("Application Name")),
  APEX_TARGET_AUTO_INSTALL_SUP_OBJECT(new Settings("targetAutoInstallSupObj")),
  APEX_TARGET_IMAGE_PREFIX(new Settings("targetImagePrefix").setArgument("Image Prefix")),
  APEX_TARGET_OFFSET(new Settings("targetOffset").setArgument("Offset")),
  APEX_TARGET_WORKSPACE(new Settings("targetWorkspace", 'w').setArgument("Workspace")),
  APEX_TARGET_PROXY(new Settings("targetProxy").setArgument("Proxy-Server")),
  APEX_TARGET_STATIC_APP_FILE_PREFIX(new Settings("targetStaticAppFilePrefix").setArgument("static App File Prefix")),
  APEX_TARGET_STATIC_PLUGIN_FILE_PREFIX(
      new Settings("targetStaticPluginFilePrefix").setArgument("static Plugin File Prefix")),
  APEX_TARGET_STATIC_THEME_FILE_PREFIX(
      new Settings("targetStaticThemeFilePrefix").setArgument("static Theme File Prefix")),

  TEMP_DIRECTORY(new Settings("tempDir").setArgument("Directory"));

  private Settings settings;

  private CommandLineOption(Settings settings) {
    this.settings = settings;
  }

  private Settings getSettings() {
    return settings;
  }

  public String getLongOption() {
    return settings.getLongOption();
  }

  public String getLongOption(String optionalPrefix) {
    if (StringUtils.isBlank(getLongOption()) || StringUtils.isBlank(optionalPrefix)) {
      return getLongOption();
    }
    return optionalPrefix.concat(getLongOption());
  }

  public boolean isAvailableOn(CommandLine commandLine) {
    return commandLine.hasOption(settings.getLongOption());
  }

  public boolean isNotAvailableOn(CommandLine commandLine) {
    return !isAvailableOn(commandLine);
  }

  public boolean isCommandOption() {
    return settings.isCommand();
  }

  public CommandType getCommandType() {
    return settings.getCommandType();
  }

  public String getArgumentValue(CommandLine commandLine) {
    return commandLine.getOptionValue(settings.getLongOption());
  }

  public synchronized static Options getOptions(MessageSource messageSource, Locale locale) {
    Options options = new Options();

    final OptionGroup commandGroup = new OptionGroup();
    commandGroup.setRequired(true);

    for (CommandLineOption commandLineOption : CommandLineOption.values()) {
      Settings settings = commandLineOption.getSettings();
      Option option = createOption(settings);
      setDescription(settings, option, messageSource, locale);
      setArgument(settings, option);
      setOptionAsCommand(settings, option, commandGroup);
      options.addOption(option);
    }
    options.addOptionGroup(commandGroup);

    return options;
  }

  private static Option createOption(Settings settings) {
    OptionBuilder.withLongOpt(settings.getLongOption());
    if (settings.hasShortOption()) {
      return OptionBuilder.create(settings.getShortOption());
    }
    return OptionBuilder.create();
  }

  private static void setDescription(Settings settings, Option option, MessageSource messageSource, Locale locale) {
    final String PREFIX = "commandLineOption.option.";
    String description = messageSource.getMessage(PREFIX + settings.getLongOption(), null, locale);
    if (StringUtils.isBlank(description)) {
      option.setDescription("No value defined for message-Key " + PREFIX + settings.getLongOption());
    } else {
      option.setDescription(description);
    }
  }

  private static void setArgument(Settings settings, Option option) {
    if (settings.hasArgument()) {
      option.setArgs(1);
      option.setArgName(settings.getArgumentName());
    }
  }

  private static void setOptionAsCommand(Settings settings, Option option, OptionGroup commandGroup) {
    if (settings.isCommand()) {
      commandGroup.addOption(option);
    }
  }

  public synchronized static Options getOptions(MessageSource messageSource) {
    return getOptions(messageSource, Locale.getDefault());
  }

  public static List<CommandLineOption> getCommandOptions() {
    List<CommandLineOption> commandOptions = new ArrayList<>();
    for (CommandLineOption option : CommandLineOption.values()) {
      addIfCommandOption(commandOptions, option);
    }
    return commandOptions;
  }

  private static void addIfCommandOption(List<CommandLineOption> commandOptions, CommandLineOption option) {
    if (option.isCommandOption()) {
      commandOptions.add(option);
    }
  }

  private static class Settings {

    private final String longOption;
    private Character shortOption;
    private String argumentName;
    private CommandType commandType;

    public Settings(String longOption) {
      if (StringUtils.isBlank(longOption)) {
        throw new IllegalArgumentException("Parameter 'longOption' must not be blank");
      }
      this.longOption = longOption;
    }

    public Settings(CommandType commandType) {
      this(commandType.getLongOption());
      this.commandType = commandType;
    }

    public Settings(String longOption, char shortOption) {
      this(longOption);
      this.shortOption = shortOption;
    }

    public Settings(CommandType commandType, char shortOption) {
      this(commandType.getLongOption(), shortOption);
      this.commandType = commandType;
    }

    public String getLongOption() {
      return longOption;
    }

    public Character getShortOption() {
      return shortOption;
    }

    public boolean hasShortOption() {
      return shortOption != null;
    }

    public Settings setArgument(String argumentName) {
      this.argumentName = argumentName;
      return this;
    }

    public String getArgumentName() {
      return argumentName;
    }

    public boolean hasArgument() {
      return StringUtils.isNotBlank(argumentName);
    }

    public CommandType getCommandType() {
      return commandType;
    }

    public boolean isCommand() {
      return commandType != null;
    }

    @Override
    public String toString() {
      return getLongOption();
    }

  }

}

package software.coolstuff.installapex.command;

public enum CommandType {

  HELP("help"),
  LIST("list"),
  EXTRACT_DDL("extractDDL"),
  EXTRACT_APEX("extractApex"),
  INSTALL("install");

  private String longOption;

  private CommandType(String longOption) {
    this.longOption = longOption;
  }

  public String getLongOption() {
    return longOption;
  }

  public String getLongOption(String prefix) {
    return prefix + longOption;
  }

}

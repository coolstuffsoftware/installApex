package io.github.mufasa1976.installApex.command;

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

}

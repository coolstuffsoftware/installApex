package io.github.mufasa1976.installApex.exception;

import io.github.mufasa1976.installApex.cli.CommandLineOption;

public class InvalidApexIdException extends InstallApexException {

  private static final long serialVersionUID = -4250446833799925955L;

  private static final String KEY_NOT_NUMERIC = "invalidApexIdException.notNumeric";
  private static final String KEY_NOT_AVALIABLE = "invalidApexIdException.notAvailable";

  public InvalidApexIdException(String apexIdAsString, CommandLineOption commandLineOption) {
    super(KEY_NOT_NUMERIC, apexIdAsString, commandLineOption.getLongOption());
  }

  public InvalidApexIdException(Integer apexId) {
    super(KEY_NOT_AVALIABLE, apexId);
  }

}

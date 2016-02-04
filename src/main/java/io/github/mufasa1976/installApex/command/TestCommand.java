package io.github.mufasa1976.installApex.command;

import javax.naming.OperationNotSupportedException;

import org.springframework.beans.factory.annotation.Autowired;

import io.github.mufasa1976.installApex.service.liquibase.LiquibaseService;

public class TestCommand extends AbstractCommand {

  @Autowired
  private LiquibaseService liquibaseService;

  @Override
  public void execute() throws OperationNotSupportedException {
    throw new OperationNotSupportedException();
  }

  @Override
  protected CommandType getCommandType() {
    return CommandType.TEST;
  }

}

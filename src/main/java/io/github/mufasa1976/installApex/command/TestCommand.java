package io.github.mufasa1976.installApex.command;

import io.github.mufasa1976.installApex.service.liquibase.LiquibaseService;

import javax.naming.OperationNotSupportedException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
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

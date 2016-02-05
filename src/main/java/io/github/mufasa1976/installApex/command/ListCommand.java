package io.github.mufasa1976.installApex.command;

import io.github.mufasa1976.installApex.service.apex.parser.ApexApplication;
import io.github.mufasa1976.installApex.service.apex.parser.ApexApplicationParserService;

import java.util.List;

import javax.naming.OperationNotSupportedException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class ListCommand extends AbstractCommand {

  private static final String NO_APPLICATIONS = "listCommand.noApplications";
  private static final String HEADER = "listCommand.header";
  private static final String FOOTER = "listCommand.footer";

  @Autowired
  private ApexApplicationParserService parserService;

  @Value("${listCommand.format}")
  private String format;

  @Override
  public void execute() throws OperationNotSupportedException {
    List<ApexApplication> candidates = parserService.getCandidates();
    if (candidates.isEmpty()) {
      printMessage(NO_APPLICATIONS);
      return;
    }

    printlnMessage(HEADER, candidates.size());
    for (ApexApplication candidate : candidates) {
      String candidateList = String.format(format, candidate.getId(), candidate.getName(), candidate.getVersion());
      println(candidateList);
    }
    printlnMessage(FOOTER, candidates.size());
  }

  @Override
  protected CommandType getCommandType() {
    return CommandType.LIST;
  }

}

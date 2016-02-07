package software.coolstuff.installapex.command;

import java.util.Collections;
import java.util.List;

import javax.naming.OperationNotSupportedException;

import org.fusesource.jansi.Ansi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import software.coolstuff.installapex.service.apex.parser.ApexApplication;
import software.coolstuff.installapex.service.apex.parser.ApexApplicationParserService;

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
    Collections.sort(candidates);

    printlnMessage(HEADER, candidates.size());
    for (ApexApplication candidate : candidates) {
      String candidateList = String.format(format, candidate.getId(), candidate.getName(), candidate.getVersion());
      println(Ansi.ansi().render(candidateList));
    }
    printlnMessage(FOOTER, candidates.size());
  }

  @Override
  protected CommandType getCommandType() {
    return CommandType.LIST;
  }

}

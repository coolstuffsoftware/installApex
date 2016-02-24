package software.coolstuff.installapex.command;

import java.util.Collections;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import software.coolstuff.installapex.exception.InstallApexException;
import software.coolstuff.installapex.exception.InstallApexException.Reason;
import software.coolstuff.installapex.service.apex.parser.ApexApplication;
import software.coolstuff.installapex.service.apex.parser.ApexApplicationParserService;

@Service
public class ListCommand extends AbstractCommand {

  private static final Logger LOG = LoggerFactory.getLogger(ListCommand.class);

  private static final String HEADER = "listCommand.header";
  private static final String FOOTER = "listCommand.footer";

  @Autowired
  private ApexApplicationParserService parserService;

  @Value("${listCommand.format}")
  private String format;

  @Override
  public void execute() {
    LOG.debug("Get all packaged APEX Applications by the APEX Application Parser");
    List<ApexApplication> candidates = parserService.getCandidates();
    if (CollectionUtils.isEmpty(candidates)) {
      throw new InstallApexException(Reason.NO_APEX_APPLICATIONS_INCLUDED, parserService.getDefaultLocation());
    }
    LOG.debug("Sort the Candidate List");
    Collections.sort(candidates);

    LOG.debug("Print the Candidate List");
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

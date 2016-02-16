package software.coolstuff.installapex.command;

import java.nio.file.Path;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import software.coolstuff.installapex.service.apex.parser.ApexApplication;
import software.coolstuff.installapex.service.apex.parser.ApexApplicationParserService;

@Service
public class ExtractApexCommand extends AbstractCommand {

  @Autowired
  private ApexApplicationParserService parserService;

  @Override
  public void execute() {
    ApexApplication candidate = getInstallationCandidate(false);
    Path outputDirectory = getSettings().getOutputDirectory();
    parserService.extract(candidate, outputDirectory);
  }

  @Override
  protected CommandType getCommandType() {
    return CommandType.EXTRACT_APEX;
  }

}

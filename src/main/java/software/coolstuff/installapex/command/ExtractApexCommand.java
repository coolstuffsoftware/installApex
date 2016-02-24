package software.coolstuff.installapex.command;

import java.nio.file.Path;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import software.coolstuff.installapex.service.apex.parser.ApexApplication;
import software.coolstuff.installapex.service.apex.parser.ApexApplicationParserService;

@Service
public class ExtractApexCommand extends AbstractCommand {

  private static final Logger LOG = LoggerFactory.getLogger(ExtractApexCommand.class);

  private static final String KEY_EXTRACT_FILE = "extractApexCommand.extractApexApplicationIntoFile";
  private static final String KEY_EXTRACT_DIRECTORY = "extractApexCommand.extractApexApplicationIntoDirectory";
  private static final String KEY_EXTRACT_DONE = "extractApexCommand.extractApexApplicationDone";

  @Autowired
  private ApexApplicationParserService parserService;

  @Override
  public void execute() {
    ApexApplication candidate = getInstallationCandidate();
    Path outputDirectory = getSettings().getOutputDirectory();
    Path applicationOutputLocation = outputDirectory.toAbsolutePath().normalize()
        .resolve(candidate.getLocation().toString());
    if (candidate.isLocationDirectory()) {
      printMessage(KEY_EXTRACT_DIRECTORY, candidate.getId(), candidate.getName(), applicationOutputLocation);
    } else {
      printMessage(KEY_EXTRACT_FILE, candidate.getId(), candidate.getName(), applicationOutputLocation);
    }
    parserService.extract(candidate, outputDirectory);
    printlnMessage(KEY_EXTRACT_DONE);
  }

  @Override
  protected CommandType getCommandType() {
    return CommandType.EXTRACT_APEX;
  }

}

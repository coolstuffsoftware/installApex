package software.coolstuff.installapex.service.apex.parser;

import java.nio.file.Path;
import java.util.List;

public interface ApexApplicationParserService {

  List<ApexApplication> getCandidates();

  String getDefaultLocation();

  Path extract(ApexApplication apexApplication, Path extractDirectory);

}

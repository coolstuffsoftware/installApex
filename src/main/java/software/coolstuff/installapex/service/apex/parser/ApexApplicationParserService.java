package software.coolstuff.installapex.service.apex.parser;

import java.util.List;

import org.springframework.core.io.Resource;

public interface ApexApplicationParserService {

  List<ApexApplication> getCandidates();

  List<ApexApplication> getCandidates(Resource baseDirectory);

}

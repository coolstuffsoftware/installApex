package io.github.mufasa1976.installApex.service.apex.parser;

import java.util.List;

import org.springframework.core.io.Resource;

public interface ApexApplicationParser {

  List<ApexApplication> getCandidates(Resource baseDirectory);

}

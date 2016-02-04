package io.github.mufasa1976.installApex.service.apex.parser;

import io.github.mufasa1976.installApex.config.TestApplicationConfiguration;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.testng.Assert;
import org.testng.annotations.Test;

@ContextConfiguration(classes = TestApplicationConfiguration.class)
public class TestApexApplicationParserService extends AbstractTestNGSpringContextTests {

  @Autowired
  private ApexApplicationParserService parser;

  @Autowired
  private ResourceLoader resourceLoader;

  @Test
  public void testParseApexDirectory() throws IOException {
    Resource apexPath = resourceLoader.getResource("classpath:/apex");
    List<ApexApplication> candidates = parser.getCandidates(apexPath);
    Assert.assertNotNull(candidates);
    Assert.assertEquals(candidates.size(), 2);
    compareList(candidates, apexPath.getFile().toPath());
  }

  private void compareList(List<ApexApplication> candidates, Path baseDirectory) {
    Map<Integer, ApexApplication> expectedCandidates = getExpectedCandidates(baseDirectory);
    for (ApexApplication candidate : candidates) {
      Assert.assertTrue(expectedCandidates.containsKey(candidate.getId()));
      ApexApplication expectedCandidate = expectedCandidates.get(candidate.getId());
      Assert.assertEquals(candidate.getName(), expectedCandidate.getName());
      Assert.assertEquals(candidate.getVersion(), expectedCandidate.getVersion());
      Assert.assertEquals(candidate.getLocation().getFileName(), expectedCandidate.getLocation().getFileName());
    }
  }

  private Map<Integer, ApexApplication> getExpectedCandidates(Path baseDirectory) {
    Map<Integer, ApexApplication> apexApplications = new HashMap<>();

    ApexApplication f103 = new ApexApplication(103);
    f103.setName("Sample Database Application");
    f103.setVersion("5.0.3");
    f103.setLocation(baseDirectory.resolve(Paths.get("f103")));
    apexApplications.put(f103.getId(), f103);

    ApexApplication f104 = new ApexApplication(104);
    f104.setName("Sample Trees");
    f104.setVersion("1.0.11");
    f104.setLocation(baseDirectory.resolve(Paths.get("f104.sql")));
    apexApplications.put(f104.getId(), f104);

    return apexApplications;
  }

  @Test
  public void testParseWrongDirectory() {
    Resource wrongPath = resourceLoader.getResource("classpath:/");
    List<ApexApplication> candidates = parser.getCandidates(wrongPath);
    Assert.assertNotNull(candidates);
    Assert.assertTrue(candidates.isEmpty());
  }

}

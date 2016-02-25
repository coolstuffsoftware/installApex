package software.coolstuff.installapex.service.apex.parser;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.testng.Assert;
import org.testng.annotations.Test;

import software.coolstuff.installapex.AbstractInstallApexTestWithContext;
import software.coolstuff.installapex.exception.InstallApexException;

public class TestApexApplicationParserService extends AbstractInstallApexTestWithContext {

  @Autowired
  private ApexApplicationParserServiceImpl parser;

  @Autowired
  private ResourceLoader resourceLoader;

  @Value("${apexApplicationParserService.apexResourceLocation}")
  private String defaultLocation;

  @Test
  public void testParseApexDirectory() throws IOException {
    Resource apexPath = resourceLoader.getResource("classpath:/apex");
    parser.setDefaultLocation("classpath:/apex");
    List<ApexApplication> candidates = parser.getCandidates();
    Assert.assertNotNull(candidates);
    Assert.assertEquals(candidates.size(), 2);
    compareList(candidates, apexPath.getFile().toPath());
  }

  @Test
  public void testParseApexDefaultDirectory() throws IOException {
    List<ApexApplication> candidates = parser.getCandidates();
    Assert.assertNotNull(candidates);
    Assert.assertEquals(candidates.size(), 2);

    Resource defaultResource = resourceLoader.getResource(defaultLocation);
    compareList(candidates, defaultResource.getFile().toPath());
  }

  @Test(expectedExceptions = InstallApexException.class,
      expectedExceptionsMessageRegExp = "installApexException.reason.noApexDirectoryIncluded")
  public void testNotExistingBaseDirectory() {
    parser.setDefaultLocation("notExistingDirectory");
    parser.getCandidates();
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
    parser.setDefaultLocation("classpath:/tns_admin");
    List<ApexApplication> candidates = parser.getCandidates();
    Assert.assertNotNull(candidates);
    Assert.assertTrue(candidates.isEmpty());
  }

}

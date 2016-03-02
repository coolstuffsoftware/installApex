package software.coolstuff.installapex.service.apex.parser;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import org.apache.commons.io.FileUtils;
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
  public void testParseApexDefaultDirectory() throws IOException {
    parser.setDefaultLocation(defaultLocation);
    List<ApexApplication> candidates = parser.getCandidates();
    Assert.assertNotNull(candidates);
    Assert.assertEquals(candidates.size(), 2);

    Resource defaultResource = resourceLoader.getResource(defaultLocation);
    compareList(candidates, defaultResource.getFile().toPath());
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
  public void testParseApexDirectory() throws IOException {
    Resource apexPath = resourceLoader.getResource("classpath:/apex");
    parser.setDefaultLocation("classpath:/apex");
    List<ApexApplication> candidates = parser.getCandidates();
    Assert.assertNotNull(candidates);
    Assert.assertEquals(candidates.size(), 2);
    compareList(candidates, apexPath.getFile().toPath());
  }

  @Test(expectedExceptions = InstallApexException.class,
      expectedExceptionsMessageRegExp = "installApexException.reason.noApexDirectoryIncluded")
  public void testNotExistingBaseDirectory() {
    parser.setDefaultLocation("notExistingDirectory");
    parser.getCandidates();
  }

  @Test(expectedExceptions = InstallApexException.class,
      expectedExceptionsMessageRegExp = "installApexException.reason.noApexApplicationsIncluded")
  public void testEmptyDirectory() throws IOException {
    Path localDirectory = Paths.get("target", "test-classes", "testWithEmptyDirectory");
    FileUtils.deleteDirectory(localDirectory.toFile());
    Files.createDirectories(localDirectory);
    parser.setDefaultLocation("testWithEmptyDirectory");
    parser.getCandidates();
  }

  @Test(expectedExceptions = InstallApexException.class,
      expectedExceptionsMessageRegExp = "installApexException.reason.noApexDirectoryIncluded")
  public void testFileAsDefaultLocation() throws IOException {
    Path fileAsLocalDirectory = Paths.get("target", "test-classes", "FileAsLocalDirectory");
    Files.deleteIfExists(fileAsLocalDirectory);
    try (Writer writer = new BufferedWriter(new FileWriter(fileAsLocalDirectory.toFile()))) {
      writer.write("This is just a Test for a local File which acts as a default location");
      writer.flush();
    }
    parser.setDefaultLocation("FileAsLocalDirectory");
    parser.getCandidates();
  }

  @Test(expectedExceptions = InstallApexException.class,
      expectedExceptionsMessageRegExp = "installApexException.reason.wrongInternalApexId")
  public void testWithWrongInternalApplicationId() {
    parser.setDefaultLocation("classpath:/apexWithWrongApp");
    parser.getCandidates();
  }

  @Test
  public void testExtractFile() throws IOException {
    parser.setDefaultLocation(defaultLocation);
    List<ApexApplication> candidates = parser.getCandidates();
    Assert.assertNotNull(candidates);
    Assert.assertFalse(candidates.isEmpty());
    ApexApplication apexApplication = null;
    for (ApexApplication candidate : candidates) {
      if (candidate.getId() == 104) {
        apexApplication = candidate;
      }
    }
    Assert.assertNotNull(apexApplication, "No Application with id 104 found");
    Path outputPath = Paths.get("target", "test-compare");
    FileUtils.deleteDirectory(outputPath.toFile());
    Files.createDirectories(outputPath);
    Path startFile = parser.extract(apexApplication, outputPath);
    Assert.assertEquals(startFile.getFileName().toString(), "f104.sql");
    Resource original = resourceLoader.getResource("classpath:/apex/f104.sql");
    Assert.assertEquals(FileUtils.checksumCRC32(startFile.toFile()), FileUtils.checksumCRC32(original.getFile()));
  }

  @Test
  public void testExtractDirectory() throws IOException {
    parser.setDefaultLocation(defaultLocation);
    List<ApexApplication> candidates = parser.getCandidates();
    Assert.assertNotNull(candidates);
    Assert.assertFalse(candidates.isEmpty());
    ApexApplication apexApplication = null;
    for (ApexApplication candidate : candidates) {
      if (candidate.getId() == 103) {
        apexApplication = candidate;
      }
    }
    Assert.assertNotNull(apexApplication, "No Application with id 103 found");
    Path outputPath = Paths.get("target", "test-compare");
    FileUtils.deleteDirectory(outputPath.toFile());
    Files.createDirectories(outputPath);
    Path startFile = parser.extract(apexApplication, outputPath);
    Assert.assertEquals(startFile.getFileName().toString(), "install.sql");
    Resource original = resourceLoader.getResource("classpath:/apex/f103");
    compareDirectories(original.getFile().toPath().toAbsolutePath(), startFile.getParent().toAbsolutePath());
  }

  private void compareDirectories(Path expected, Path actual) throws IOException {
    Map<Path, Long> checksums = new HashMap<>();
    try (Stream<Path> stream = Files.walk(expected)) {
      stream.forEach(path -> {
        if (Files.isDirectory(path)) {
          return;
        }
        try {
          checksums.put(expected.relativize(path), FileUtils.checksumCRC32(path.toFile()));
        } catch (Exception e) {
          throw new RuntimeException(e);
        }
      });
    }
    try (Stream<Path> stream = Files.walk(actual)) {
      stream.forEachOrdered(path -> {
        if (Files.isDirectory(path)) {
          return;
        }
        try {
          Path relativizedPath = actual.relativize(path);
          Long expectedChecksum = checksums.get(relativizedPath);
          Assert.assertNotNull(expectedChecksum);
          Long checksum = Long.valueOf(FileUtils.checksumCRC32(path.toFile()));
          Assert.assertEquals(checksum, expectedChecksum, "Wrong Checksum on File " + relativizedPath);
        } catch (Exception e) {
          throw new RuntimeException(e);
        }
      });
    }
  }

  @Test
  public void testParseWrongDirectory() {
    parser.setDefaultLocation("classpath:/tns_admin");
    List<ApexApplication> candidates = parser.getCandidates();
    Assert.assertNotNull(candidates);
    Assert.assertTrue(candidates.isEmpty());
  }

}

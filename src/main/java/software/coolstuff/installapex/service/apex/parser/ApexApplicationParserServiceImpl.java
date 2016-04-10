package software.coolstuff.installapex.service.apex.parser;

import java.io.IOException;
import java.net.JarURLConnection;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.file.DirectoryStream;
import java.nio.file.FileSystem;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.regex.MatchResult;
import java.util.stream.Stream;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.CharUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;

import software.coolstuff.installapex.exception.InstallApexException;
import software.coolstuff.installapex.exception.InstallApexException.Reason;

@Service
public class ApexApplicationParserServiceImpl implements ApexApplicationParserService {

  private static final Logger LOG = LoggerFactory.getLogger(ApexApplicationParserServiceImpl.class);

  private static final String SQL_SUFFIX = ".sql";
  private static final String[] CREATE_APPLICATION_PATH = new String[] { "application", "create_application.sql" };
  private static final String INSTALL_SCRIPT = "install.sql";

  @Autowired
  private ResourceLoader resourceLoader;

  @Value("${apexApplicationParserService.apexResourceLocation}")
  private String defaultLocation;

  void setDefaultLocation(String defaultLocation) {
    this.defaultLocation = defaultLocation;
  }

  @Override
  public List<ApexApplication> getCandidates() {
    Resource baseDirectoryAsResource = getBaseDirectory();
    checkBaseDirectoryResource(baseDirectoryAsResource);
    FileSystem fileSystem = null;
    try {
      fileSystem = createFileSystemFrom(baseDirectoryAsResource);
      Path baseDirectory = convertToPathFrom(baseDirectoryAsResource);
      checkBaseDirectory(baseDirectoryAsResource.getFilename(), baseDirectory);
      return parseApexApplications(baseDirectoryAsResource.getURI());
    } catch (InstallApexException reThrowable) {
      throw reThrowable;
    } catch (Exception e) {
      throw new InstallApexException(Reason.ERROR_ON_APEX_DIRECTORY_ACCESS, e, baseDirectoryAsResource.getFilename(),
          e.getMessage());
    } finally {
      closeOpenNonDefaultFileSystem(baseDirectoryAsResource, fileSystem);
    }
  }

  private Resource getBaseDirectory() {
    Resource baseDirectoryAsResource = resourceLoader.getResource(defaultLocation);
    return baseDirectoryAsResource;
  }

  private void checkBaseDirectoryResource(Resource baseDirectoryAsResource) {
    if (!baseDirectoryAsResource.exists()) {
      throw new InstallApexException(Reason.NO_APEX_DIRECTORY_INCLUDED, baseDirectoryAsResource.getDescription());
    }
  }

  private FileSystem createFileSystemFrom(Resource baseDirectoryAsResource) throws IOException, URISyntaxException {
    if (isNotInJar(baseDirectoryAsResource)) {
      return FileSystems.getDefault();
    }

    // first get the URL of the JAR-Archive
    URL jarURL = baseDirectoryAsResource.getURL();
    JarURLConnection jarURLConnection = (JarURLConnection) jarURL.openConnection();
    URL jarFileURL = jarURLConnection.getJarFileURL();
    LOG.debug("URL of the JarFile: {}", jarFileURL);
    Path jarFilePath = Paths.get(jarFileURL.toURI());
    LOG.debug("Path of the JarFile: {}", jarFilePath);
    URI jarFileURI = new URI("jar", jarFilePath.toUri().toString(), null);
    LOG.debug("URI of the JarFile: {}", jarFileURI);

    // then create a new FileSystem for this JAR-Archive
    Map<String, String> env = new HashMap<>();
    return FileSystems.newFileSystem(jarFileURI, env);
  }

  private boolean isNotInJar(Resource resource) throws IOException {
    return !isInJar(resource);
  }

  private boolean isInJar(Resource resource) throws IOException {
    URL baseDirectoryURL = resource.getURL();
    String protocol = baseDirectoryURL.getProtocol();
    return "jar".equals(protocol);
  }

  private Path convertToPathFrom(Resource baseDirectoryAsResource) throws IOException {
    URI baseDirectoryURI = baseDirectoryAsResource.getURI();
    return Paths.get(baseDirectoryURI);
  }

  private void checkBaseDirectory(String directoryName, Path baseDirectory) throws IOException {
    if (isNotExistingAndNotReadableDirectory(baseDirectory)) {
      throw new InstallApexException(Reason.NO_APEX_DIRECTORY_INCLUDED, directoryName);
    }
    if (isEmptyDirectory(baseDirectory)) {
      throw new InstallApexException(Reason.NO_APEX_APPLICATIONS_INCLUDED, directoryName);
    }
  }

  private boolean isNotExistingAndNotReadableDirectory(Path path) {
    return !isExistingAndReadableDirectory(path);
  }

  private boolean isExistingAndReadableDirectory(Path path) {
    return Files.exists(path) && Files.isReadable(path) && Files.isDirectory(path);
  }

  private boolean isEmptyDirectory(Path path) throws IOException {
    int numberOfEntries = 0;
    try (DirectoryStream<Path> stream = Files.newDirectoryStream(path)) {
      for (Iterator<Path> iterator = stream.iterator(); iterator.hasNext(); iterator.next()) {
        numberOfEntries++;
      }
    }
    return numberOfEntries == 0;
  }

  private List<ApexApplication> parseApexApplications(URI uri) throws IOException {
    Path baseDirectory = Paths.get(uri);
    List<ApexApplication> apexApplications = new ArrayList<>();
    try (DirectoryStream<Path> stream = Files.newDirectoryStream(baseDirectory)) {
      for (Path path : stream) {
        if (isSQLFile(path)) {
          addApexApplication(path, apexApplications);
        }
        if (isApexDirectory(path)) {
          addApexApplication(path, apexApplications);
        }
      }
    }
    relativizePaths(baseDirectory, apexApplications);
    return apexApplications;
  }

  private boolean isSQLFile(Path path) {
    if (isNotExistingAndNotReadableFile(path)) {
      return false;
    }
    String fileName = path.getFileName().toString();
    return fileName.endsWith(SQL_SUFFIX);
  }

  private boolean isNotExistingAndNotReadableFile(Path path) {
    return !isExistingAndReadableFile(path);
  }

  private boolean isExistingAndReadableFile(Path path) {
    return Files.exists(path) && Files.isReadable(path) && Files.isRegularFile(path);
  }

  private void addApexApplication(Path location, List<ApexApplication> apexApplications) {
    int applicationId = extractApplicationIdFromPath(location);
    ApexApplication apexApplication = new ApexApplication(applicationId);
    apexApplication.setLocation(location);
    if (Files.isDirectory(location)) {
      Path createApplicationPath = getCreateApplicationPathBasedOnFileSystemOf(location);
      parseApplicationFiles(location.resolve(createApplicationPath), apexApplication);
      apexApplication.setLocationIsDirectory(true);
    } else {
      parseApplicationFiles(location, apexApplication);
      apexApplication.setLocationIsDirectory(false);
    }
    apexApplications.add(apexApplication);
  }

  private Path getCreateApplicationPathBasedOnFileSystemOf(Path location) {
    String firstArgument = CREATE_APPLICATION_PATH[0];
    String[] secondPlusArguments = (String[]) ArrayUtils.subarray(CREATE_APPLICATION_PATH, 1,
        CREATE_APPLICATION_PATH.length);
    FileSystem fileSystem = location.getFileSystem();
    return fileSystem.getPath(firstArgument, secondPlusArguments);
  }

  private int extractApplicationIdFromPath(Path location) {
    Path fileName = location.getFileName();
    LOG.debug("Extract ApplicationId from FileName {}", fileName);
    String applicationIdAsString = fileName.toString().substring(1);
    if (Files.isRegularFile(location)) {
      applicationIdAsString = StringUtils.substring(applicationIdAsString, 0, SQL_SUFFIX.length() * -1);
    }
    if (Files.isDirectory(location)
        && !CharUtils.isAsciiNumeric(applicationIdAsString.charAt(applicationIdAsString.length() - 1))) {
      applicationIdAsString = StringUtils.substring(applicationIdAsString, 0, -1);
    }
    LOG.debug("Try to parse extracted ApplicationId {} as Integer", applicationIdAsString);
    return Integer.parseInt(applicationIdAsString);
  }

  private void parseApplicationFiles(Path file, ApexApplication apexApplication) {
    try (Scanner scanner = new Scanner(file)) {
      LOG.debug("Content of File {}", file);
      scanner.useDelimiter(
          "[Ww][Ww][Vv]_[Ff][Ll][Oo][Ww]_[Aa][Pp][Ii]\\.[Cc][Rr][Ee][Aa][Tt][Ee]_[Ff][Ll][Oo][Ww]\\s*\\(");
      if (scanner.hasNext()) {
        scanner.next(); // ignore the first Part
        scanner.useDelimiter("\n[Ee][Nn][Dd]\\;\n");
        if (scanner.hasNext()) {
          parseInstallationBlock(scanner.next(), apexApplication);
        }
      }
    } catch (InstallApexException reThrowable) {
      throw reThrowable;
    } catch (Exception e) {
      throw new InstallApexException(Reason.APEX_PARSER_EXCEPTION, e, file, apexApplication.getId(), e.getMessage())
          .setPrintStrackTrace(true);
    }
  }

  private void parseInstallationBlock(String installationBlock, ApexApplication apexApplication) {
    checkApplicationId(installationBlock, apexApplication);
    parseApplicationName(installationBlock, apexApplication);
    parseApplicationVersion(installationBlock, apexApplication);
  }

  private void checkApplicationId(String installationBlock, ApexApplication apexApplication) {
    try (Scanner scanner = new Scanner(installationBlock)) {
      scanner.findWithinHorizon(
          "[Ww][Ww][Vv]_[Ff][Ll][Oo][Ww]_[Aa][Pp][Pp][Ll][Ii][Cc][Aa][Tt][Ii][Oo][Nn]_[Ii][Nn][Ss][Tt][Aa][Ll][Ll]\\.[Gg][Ee][Tt]_[Aa][Pp][Pp][Ll][Ii][Cc][Aa][Tt][Ii][Oo][Nn]_[Ii][Dd]\\s*,\\s*(\\d+)\\)",
          0);
      MatchResult matchResult = scanner.match();
      if (matchResult.groupCount() >= 1) {
        int applicationId = Integer.parseInt(matchResult.group(1));
        if (applicationId != apexApplication.getId()) {
          throw new InstallApexException(Reason.WRONG_INTERNAL_APEX_ID, apexApplication, apexApplication.getId(),
              apexApplication.getLocation());
        }
      }
    }
  }

  private void parseApplicationName(String installationBlock, ApexApplication apexApplication) {
    try (Scanner scanner = new Scanner(installationBlock)) {
      scanner.findWithinHorizon(
          "[Ww][Ww][Vv]_[Ff][Ll][Oo][Ww]_[Aa][Pp][Pp][Ll][Ii][Cc][Aa][Tt][Ii][Oo][Nn]_[Ii][Nn][Ss][Tt][Aa][Ll][Ll]\\.[Gg][Ee][Tt]_[Aa][Pp][Pp][Ll][Ii][Cc][Aa][Tt][Ii][Oo][Nn]_[Nn][Aa][Mm][Ee]\\s*,\\s*'(.*)'\\)",
          0);
      MatchResult matchResult = scanner.match();
      if (matchResult.groupCount() >= 1) {
        apexApplication.setName(matchResult.group(1));
      }
    }
  }

  private void parseApplicationVersion(String installationBlock, ApexApplication apexApplication) {
    try (Scanner scanner = new Scanner(installationBlock)) {
      scanner.findWithinHorizon(",[Pp]_[Ff][Ll][Oo][Ww]_[Vv][Ee][Rr][Ss][Ii][Oo][Nn]=>'(.*)'", 0);
      MatchResult matchResult = scanner.match();
      if (matchResult.groupCount() >= 1) {
        apexApplication.setVersion(matchResult.group(1));
      }
    }
  }

  private boolean isApexDirectory(Path path) throws IOException {
    if (isNotExistingAndNotReadableDirectory(path)) {
      return false;
    }

    Path createApplicationPath = getCreateApplicationPathBasedOnFileSystemOf(path);
    return isExistingAndReadableFile(path.resolve(createApplicationPath));
  }

  private void relativizePaths(Path baseDirectory, List<ApexApplication> apexApplications) {
    for (ApexApplication apexApplication : apexApplications) {
      Path location = apexApplication.getLocation();
      location = baseDirectory.relativize(location);
      apexApplication.setLocation(location);
    }
  }

  private void closeOpenNonDefaultFileSystem(Resource baseDirectoryAsResource, FileSystem fileSystem) {
    if (fileSystem != null && !FileSystems.getDefault().equals(fileSystem)) {
      try {
        fileSystem.close();
      } catch (IOException e) {
        throw new InstallApexException(Reason.ERROR_ON_APEX_DIRECTORY_ACCESS, e, baseDirectoryAsResource.getFilename(),
            e.getMessage());
      }
    }
  }

  @Override
  public String getDefaultLocation() {
    return defaultLocation;
  }

  @Override
  public Path extract(ApexApplication apexApplication, Path extractDirectory) {
    Resource baseDirectoryAsResource = getBaseDirectory();
    checkBaseDirectoryResource(baseDirectoryAsResource);
    FileSystem fileSystem = null;
    try {
      fileSystem = createFileSystemFrom(baseDirectoryAsResource);
      Path baseDirectory = convertToPathFrom(baseDirectoryAsResource);
      checkBaseDirectory(baseDirectoryAsResource.getFilename(), baseDirectory);
      Path packageApexApplication = baseDirectory.resolve(apexApplication.getLocation());
      return extract(packageApexApplication, extractDirectory);
    } catch (Exception e) {
      throw new InstallApexException(Reason.ERROR_ON_APEX_DIRECTORY_ACCESS, e, baseDirectoryAsResource.getFilename(),
          e.getMessage());
    } finally {
      closeOpenNonDefaultFileSystem(baseDirectoryAsResource, fileSystem);
    }
  }

  private Path extract(Path packagedApexApplication, Path extractDirectory) throws IOException {
    Path fileName = packagedApexApplication.getFileName();
    Path extractionLocation = extractDirectory.resolve(fileName.toString()).normalize();
    if (Files.isRegularFile(packagedApexApplication)) {
      LOG.debug("Extract APEX Application File {} to {}", packagedApexApplication.toAbsolutePath(),
          extractionLocation.toAbsolutePath());
      Files.copy(packagedApexApplication, extractionLocation, StandardCopyOption.REPLACE_EXISTING,
          StandardCopyOption.COPY_ATTRIBUTES);
      return extractionLocation;
    }
    return extractDirectory(packagedApexApplication, extractionLocation);
  }

  private Path extractDirectory(Path packagedApexApplication, Path extractionDirectory) throws IOException {
    if (Files.exists(extractionDirectory)) {
      LOG.debug("Remove existing Extraction Directory {}", extractionDirectory.toAbsolutePath());
      FileUtils.deleteDirectory(extractionDirectory.toFile());
    }
    LOG.debug("Create Extraction Directory {}", extractionDirectory.toAbsolutePath());
    Files.createDirectories(extractionDirectory.toAbsolutePath());

    try (Stream<Path> stream = Files.walk(packagedApexApplication)) {
      stream.forEach((path) -> {
        try {
          Path pathExtension = packagedApexApplication.toAbsolutePath().normalize().relativize(path);
          Path extractionLocation = extractionDirectory.resolve(pathExtension.toString()).normalize();

          if (Files.isDirectory(path)) {
            LOG.debug("Create Directory {}", extractionLocation);
            Files.createDirectories(extractionLocation);
            return;
          }

          LOG.debug("Extract APEX Application File {} to {}", path, extractionLocation);
          Files.copy(path, extractionLocation, StandardCopyOption.REPLACE_EXISTING, StandardCopyOption.COPY_ATTRIBUTES);
        } catch (Exception e) {
          throw new InstallApexException(Reason.ERROR_ON_APEX_DIRECTORY_ACCESS, e, packagedApexApplication,
              e.getMessage());
        }
      });
    }
    Path installScript = extractionDirectory.resolve(INSTALL_SCRIPT);
    if (!Files.exists(installScript)) {
      throw new InstallApexException(Reason.NO_APEX_INSTALLATION_SCRIPT_AVAILABLE, INSTALL_SCRIPT,
          extractionDirectory.toAbsolutePath());
    }
    return installScript;
  }

}

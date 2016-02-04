package io.github.mufasa1976.installApex.service.apex.parser;

import io.github.mufasa1976.installApex.exception.InstallApexException;
import io.github.mufasa1976.installApex.exception.InstallApexException.Reason;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.regex.MatchResult;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;

@Service
public class ApexApplicationParserServiceImpl implements ApexApplicationParserService {

  private static final Logger log = LoggerFactory.getLogger(ApexApplicationParserServiceImpl.class);

  private static final String SQL_SUFFIX = ".sql";
  private static final Path CREATE_APPLICATION_PATH = Paths.get("application", "create_application.sql");

  @Autowired
  private ResourceLoader resourceLoader;

  @Value("${apexApplicationParserService.apexResourceLocation}")
  private String defaultLocation;

  @Override
  public List<ApexApplication> getCandidates() {
    Resource baseDirectory = resourceLoader.getResource(defaultLocation);
    return getCandidates(baseDirectory);
  }

  @Override
  public List<ApexApplication> getCandidates(Resource baseDirectory) {
    checkBaseDirectory(baseDirectory);
    List<ApexApplication> apexApplications = new ArrayList<>();
    try {
      parseApexApplications(baseDirectory.getFile(), apexApplications);
    } catch (IOException e) {
      throw new InstallApexException(Reason.ERROR_ON_APEX_DIRECTORY_ACCESS, e, baseDirectory.getFilename(),
          e.getMessage());
    }
    return apexApplications;
  }

  private void checkBaseDirectory(Resource baseDirectoryAsResource) {
    if (baseDirectoryAsResource == null) {
      throw new IllegalStateException("baseDirectory Resource is null");
    }
    String directoryName = baseDirectoryAsResource.getFilename();
    if (!baseDirectoryAsResource.exists()) {
      throw new InstallApexException(Reason.NO_APEX_DIRECTORY_INCLUDED, directoryName);
    }
    try {
      Path baseDirectory = baseDirectoryAsResource.getFile().toPath();
      checkBaseDirectory(directoryName, baseDirectory);
    } catch (IOException e) {
      throw new InstallApexException(Reason.ERROR_ON_APEX_DIRECTORY_ACCESS, e, directoryName, e.getMessage());
    }
  }

  private void checkBaseDirectory(String directoryName, Path baseDirectory) {
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

  private boolean isEmptyDirectory(Path path) {
    return ArrayUtils.isEmpty(path.toFile().listFiles());
  }

  private void parseApexApplications(File baseDirectory, List<ApexApplication> apexApplications) throws IOException {
    for (File file : baseDirectory.listFiles()) {
      Path path = file.toPath();
      if (isSQLFile(path)) {
        addApexApplication(path, apexApplications);
      }
      if (isApexDirectory(path)) {
        addApexApplication(path, apexApplications);
      }
    }
    relativizePaths(baseDirectory.toPath(), apexApplications);
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
      parseApplicationFiles(location.resolve(CREATE_APPLICATION_PATH), apexApplication);
    } else {
      parseApplicationFiles(location, apexApplication);
    }
    apexApplications.add(apexApplication);
  }

  private int extractApplicationIdFromPath(Path location) {
    String applicationIdAsString = location.getFileName().toString().substring(1);
    if (Files.isRegularFile(location)) {
      applicationIdAsString = StringUtils.substring(applicationIdAsString, 0, SQL_SUFFIX.length() * -1);
    }
    return Integer.parseInt(applicationIdAsString);
  }

  private void parseApplicationFiles(Path file, ApexApplication apexApplication) {
    try (Scanner scanner = new Scanner(file)) {
      log.debug("Content of File {}", file);
      scanner
      .useDelimiter("[Ww][Ww][Vv]_[Ff][Ll][Oo][Ww]_[Aa][Pp][Ii]\\.[Cc][Rr][Ee][Aa][Tt][Ee]_[Ff][Ll][Oo][Ww]\\s*\\(");
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
      scanner
          .findWithinHorizon(
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
      scanner
          .findWithinHorizon(
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

    return isExistingAndReadableFile(path.resolve(CREATE_APPLICATION_PATH));
  }

  private void relativizePaths(Path baseDirectory, List<ApexApplication> apexApplications) {
    for (ApexApplication apexApplication : apexApplications) {
      Path location = apexApplication.getLocation();
      location = baseDirectory.relativize(location);
      apexApplication.setLocation(location);
    }
  }

}

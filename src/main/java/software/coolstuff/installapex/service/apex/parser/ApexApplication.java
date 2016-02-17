package software.coolstuff.installapex.service.apex.parser;

import java.nio.file.Path;
import java.util.Objects;

public class ApexApplication implements Comparable<ApexApplication> {

  private final int id;
  private String name;
  private String version;
  private Path location;
  private boolean locationIsDirectory;

  public ApexApplication(int id) {
    this.id = id;
  }

  public int getId() {
    return id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getVersion() {
    return version;
  }

  public void setVersion(String version) {
    this.version = version;
  }

  public Path getLocation() {
    return location;
  }

  public void setLocation(Path location) {
    this.location = location;
  }

  public void setLocationIsDirectory(boolean locationIsDirectory) {
    this.locationIsDirectory = locationIsDirectory;
  }

  public boolean isLocationDirectory() {
    return locationIsDirectory;
  }

  @Override
  public int hashCode() {
    return Objects.hash(id);
  }

  @Override
  public boolean equals(Object otherObj) {
    if (!(otherObj instanceof ApexApplication)) {
      return false;
    }

    ApexApplication other = (ApexApplication) otherObj;

    return Objects.equals(this.id, other.id);
  }

  @Override
  public String toString() {
    return ApexApplication.class.getSimpleName() + "{id:" + id + ",name:"
        + (name == null ? "null" : "\"" + name + "\"") + ",version:"
        + (version == null ? "null" : "\"" + version + "\"") + ",location:"
        + (location == null ? "null" : "\"" + location.toString() + "\"") + "}";
  }

  @Override
  public int compareTo(ApexApplication o) {
    return this.id - o.id;
  }

}

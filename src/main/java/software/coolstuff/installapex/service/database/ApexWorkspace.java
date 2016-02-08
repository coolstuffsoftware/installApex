package software.coolstuff.installapex.service.database;

public class ApexWorkspace {

  private long id;
  private String name;

  public ApexWorkspace() {}

  public ApexWorkspace(long id, String name) {
    this.id = id;
    this.name = name;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

}

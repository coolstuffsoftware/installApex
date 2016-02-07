package software.coolstuff.installapex.service.database;

public class ApexWorkspace {

  private int id;
  private String name;

  public ApexWorkspace() {}

  public ApexWorkspace(int id, String name) {
    this.id = id;
    this.name = name;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

}

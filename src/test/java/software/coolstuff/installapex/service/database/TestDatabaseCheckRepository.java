package software.coolstuff.installapex.service.database;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.datasource.DelegatingDataSource;
import org.testng.Assert;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import software.coolstuff.installapex.AbstractInstallApexTestWithContext;

public class TestDatabaseCheckRepository extends AbstractInstallApexTestWithContext {

  @Autowired
  private DataSource dataSource;

  @Autowired
  private DelegatingDataSource delegatingDataSource;

  @Autowired
  private DatabaseCheckRepository repository;

  @BeforeClass
  public void setUp() {
    // replace the empty DataSource Implementation by the Test DataSource
    delegatingDataSource.setTargetDataSource(dataSource);
  }

  @Test
  public void testGetApexVersion() {
    String apexVersion = repository.getApexVersion();
    Assert.assertEquals(apexVersion, "5.0.1");
  }

  @Test
  public void testGetApexWorkspacesForPublic() {
    List<ApexWorkspace> apexWorkspaces = repository.getApexWorkspacesFor("PUBLIC");
    Assert.assertNotNull(apexWorkspaces);
    Assert.assertFalse(apexWorkspaces.isEmpty());
    Assert.assertEquals(apexWorkspaces.size(), 1);
  }

  @Test
  public void testGetApexWorkspacesForOther() {
    List<ApexWorkspace> apexWorkspaces = repository.getApexWorkspacesFor("OTHER");
    Assert.assertNotNull(apexWorkspaces);
    Assert.assertFalse(apexWorkspaces.isEmpty());
    Assert.assertEquals(apexWorkspaces.size(), 2);
  }

  @Test
  public void testGetApexWorkspacesForNotRegisteredUser() {
    List<ApexWorkspace> apexWorkspaces = repository.getApexWorkspacesFor("NOT_REGISTERED");
    Assert.assertNotNull(apexWorkspaces);
    Assert.assertTrue(apexWorkspaces.isEmpty());
  }

  @Test
  public void testGetApexWorkspacesForNullUser() {
    List<ApexWorkspace> apexWorkspaces = repository.getApexWorkspacesFor(null);
    Assert.assertNotNull(apexWorkspaces);
    Assert.assertFalse(apexWorkspaces.isEmpty());
  }

  @Test
  public void testApplicationExists() {
    boolean existsApexApplication = repository.existsApexApplication(103);
    Assert.assertTrue(existsApexApplication);
  }

  @Test(expectedExceptions = EmptyResultDataAccessException.class)
  public void testApplicationNotExists() {
    repository.existsApexApplication(104);
  }

  @Test
  public void testSessionRoles() {
    List<String> sessionRoles = repository.getSessionRoles();
    Assert.assertNotNull(sessionRoles);
    Assert.assertFalse(sessionRoles.isEmpty());
    Assert.assertEquals(sessionRoles.size(), 1);
    Assert.assertEquals(sessionRoles.get(0), "APEX_ADMINISTRATOR_ROLE");
  }

}

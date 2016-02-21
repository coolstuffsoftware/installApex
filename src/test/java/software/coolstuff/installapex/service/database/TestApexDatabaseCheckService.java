package software.coolstuff.installapex.service.database;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;

import org.mockito.Matchers;
import org.mockito.Mockito;
import org.springframework.dao.EmptyResultDataAccessException;
import org.testng.Assert;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

import software.coolstuff.installapex.AbstractInstallApexTestWithContext;
import software.coolstuff.installapex.exception.InstallApexException;

public class TestApexDatabaseCheckService extends AbstractInstallApexTestWithContext {

  private DatabaseCheckService apexDatabaseCheckService;
  private DatabaseCheckRepository databaseCheckRepository;

  @BeforeMethod
  public void setUp() {
    DatabaseCheckServiceImpl databaseCheckService = new DatabaseCheckServiceImpl();
    databaseCheckRepository = Mockito.mock(DatabaseCheckRepository.class);
    prepareDatabaseCheckRepository();
    databaseCheckService.setRepository(databaseCheckRepository);
    apexDatabaseCheckService = databaseCheckService;
  }

  private void prepareDatabaseCheckRepository() {
    Mockito.when(databaseCheckRepository.getApexVersion()).thenReturn("5.0.1.00.06");
    Mockito.when(databaseCheckRepository.getApexWorkspacesFor("PUBLIC"))
        .thenReturn(Arrays.asList(new ApexWorkspace[] { new ApexWorkspace(1, "DEVELOPMENT") }));
    Mockito.when(databaseCheckRepository.getApexWorkspacesFor("OTHER")).thenReturn(
        Arrays.asList(new ApexWorkspace[] { new ApexWorkspace(1, "DEVELOPMENT"), new ApexWorkspace(2, "PRODUCTION") }));
    Mockito.when(databaseCheckRepository.getApexWorkspacesFor("NOT_REGISTERED")).thenReturn(new ArrayList<>());
    Mockito.when(databaseCheckRepository.existsApexApplication(Matchers.anyInt())).thenReturn(false);
    Mockito.when(databaseCheckRepository.existsApexApplication(103)).thenReturn(true);
    Mockito.when(databaseCheckRepository.getApexInstallationSchema()).thenReturn("APEX_050000");
    Mockito.when(databaseCheckRepository.getSessionRoles())
        .thenReturn(Arrays.asList(new String[] { "APEX_ADMINISTRATOR_ROLE", "CONNECT" }));
    Mockito.when(databaseCheckRepository.getCurrentSchema()).thenReturn("SCOTT");
  }

  @Test
  public void testGetApexVersion() {
    String apexVersion = apexDatabaseCheckService.getApexVersion();
    Assert.assertEquals(apexVersion, "5.0.1.00.06");
  }

  @Test(expectedExceptions = InstallApexException.class,
      expectedExceptionsMessageRegExp = "installApexException.reason.noApexInstalled")
  public void testNoApexInstalled() {
    Mockito.when(databaseCheckRepository.getApexVersion()).thenThrow(EmptyResultDataAccessException.class);
    apexDatabaseCheckService.getApexVersion();
  }

  @Test
  public void testGetWorkspacesForPublic() {
    Map<String, Long> mappedWorkspaces = apexDatabaseCheckService.getApexWorkspacesFor("PUBLIC");
    Assert.assertNotNull(mappedWorkspaces);
    Assert.assertFalse(mappedWorkspaces.isEmpty());
    Assert.assertEquals(mappedWorkspaces.size(), 1);
    Assert.assertTrue(mappedWorkspaces.containsKey("DEVELOPMENT"));
    Assert.assertFalse(mappedWorkspaces.containsKey("PRODUCTION"));
    Assert.assertEquals(mappedWorkspaces.get("DEVELOPMENT"), Long.valueOf(1));
  }

  @Test
  public void testGetWorkspacesForOther() {
    Map<String, Long> mappedWorkspaces = apexDatabaseCheckService.getApexWorkspacesFor("OTHER");
    Assert.assertNotNull(mappedWorkspaces);
    Assert.assertFalse(mappedWorkspaces.isEmpty());
    Assert.assertEquals(mappedWorkspaces.size(), 2);
    Assert.assertTrue(mappedWorkspaces.containsKey("DEVELOPMENT"));
    Assert.assertTrue(mappedWorkspaces.containsKey("PRODUCTION"));
    Assert.assertEquals(mappedWorkspaces.get("DEVELOPMENT"), Long.valueOf(1));
    Assert.assertEquals(mappedWorkspaces.get("PRODUCTION"), Long.valueOf(2));
  }

  @Test
  public void testGetWorkspacesForNotRegistered() {
    Map<String, Long> mappedWorkspaces = apexDatabaseCheckService.getApexWorkspacesFor("NOT_REGISTERED");
    Assert.assertNotNull(mappedWorkspaces);
    Assert.assertTrue(mappedWorkspaces.isEmpty());
  }

  @Test
  public void testApplicationExists() {
    boolean existsApexApplication = apexDatabaseCheckService.existsApexApplication(103);
    Assert.assertTrue(existsApexApplication);
  }

  @Test
  public void testApplicationNotExists() {
    boolean existsApexApplication = apexDatabaseCheckService.existsApexApplication(104);
    Assert.assertFalse(existsApexApplication);
  }

  @Test
  public void testIsApexAdministrator() {
    boolean apexAdministrator = apexDatabaseCheckService.isApexAdministrator();
    Assert.assertTrue(apexAdministrator);
  }

  @Test
  public void testIsNoApexAdministrator() {
    Mockito.when(databaseCheckRepository.getSessionRoles()).thenReturn(Arrays.asList(new String[] { "CONNECT" }));
    boolean apexAdministrator = apexDatabaseCheckService.isApexAdministrator();
    Assert.assertFalse(apexAdministrator);
  }

  @Test
  public void testIsApexAdministratorByApexSchemaOwner() {
    Mockito.when(databaseCheckRepository.getCurrentSchema()).thenReturn("APEX_050000");
    boolean apexAdministrator = apexDatabaseCheckService.isApexAdministrator();
    Assert.assertTrue(apexAdministrator);
  }

  @Test
  public void testIsApexAdministratorBySystemUser() {
    Mockito.when(databaseCheckRepository.getCurrentSchema()).thenReturn("SYSTEM");
    boolean apexAdministrator = apexDatabaseCheckService.isApexAdministrator();
    Assert.assertTrue(apexAdministrator);
  }

}

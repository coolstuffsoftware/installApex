package software.coolstuff.installapex.service.database;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;

import org.mockito.Mockito;
import org.springframework.dao.EmptyResultDataAccessException;
import org.testng.Assert;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

import software.coolstuff.installapex.AbstractInstallApexTestWithContext;
import software.coolstuff.installapex.exception.InstallApexException;

public class TestApexDatabaseCheckService extends AbstractInstallApexTestWithContext {

  private ApexDatabaseCheckService apexDatabaseCheckService;
  private DatabaseCheckRepository databaseCheckRepository;

  @BeforeMethod
  public void setUp() {
    apexDatabaseCheckService = new DatabaseCheckServiceImpl();
    databaseCheckRepository = Mockito.mock(DatabaseCheckRepository.class);
    prepareDatabaseCheckRepository();
    ((DatabaseCheckServiceImpl) apexDatabaseCheckService).setRepository(databaseCheckRepository);
  }

  private void prepareDatabaseCheckRepository() {
    Mockito.when(databaseCheckRepository.getApexVersion()).thenReturn("5.0.1.00.06");
    Mockito.when(databaseCheckRepository.getApexWorkspacesFor("PUBLIC"))
        .thenReturn(Arrays.asList(new ApexWorkspace[] { new ApexWorkspace(1, "DEVELOPMENT") }));
    Mockito.when(databaseCheckRepository.getApexWorkspacesFor("OTHER")).thenReturn(
        Arrays.asList(new ApexWorkspace[] { new ApexWorkspace(1, "DEVELOPMENT"), new ApexWorkspace(2, "PRODUCTION") }));
    Mockito.when(databaseCheckRepository.getApexWorkspacesFor("NOT_REGISTERED")).thenReturn(new ArrayList<>());
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
    Map<String, Integer> mappedWorkspaces = apexDatabaseCheckService.getApexWorkspacesFor("PUBLIC");
    Assert.assertNotNull(mappedWorkspaces);
    Assert.assertFalse(mappedWorkspaces.isEmpty());
    Assert.assertEquals(mappedWorkspaces.size(), 1);
    Assert.assertTrue(mappedWorkspaces.containsKey("DEVELOPMENT"));
    Assert.assertFalse(mappedWorkspaces.containsKey("PRODUCTION"));
    Assert.assertEquals(mappedWorkspaces.get("DEVELOPMENT"), Integer.valueOf(1));
  }

  @Test
  public void testGetWorkspacesForOther() {
    Map<String, Integer> mappedWorkspaces = apexDatabaseCheckService.getApexWorkspacesFor("OTHER");
    Assert.assertNotNull(mappedWorkspaces);
    Assert.assertFalse(mappedWorkspaces.isEmpty());
    Assert.assertEquals(mappedWorkspaces.size(), 2);
    Assert.assertTrue(mappedWorkspaces.containsKey("DEVELOPMENT"));
    Assert.assertTrue(mappedWorkspaces.containsKey("PRODUCTION"));
    Assert.assertEquals(mappedWorkspaces.get("DEVELOPMENT"), Integer.valueOf(1));
    Assert.assertEquals(mappedWorkspaces.get("PRODUCTION"), Integer.valueOf(2));
  }

  @Test
  public void testGetWorkspacesForNotRegistered() {
    Map<String, Integer> mappedWorkspaces = apexDatabaseCheckService.getApexWorkspacesFor("NOT_REGISTERED");
    Assert.assertNotNull(mappedWorkspaces);
    Assert.assertTrue(mappedWorkspaces.isEmpty());
  }

}

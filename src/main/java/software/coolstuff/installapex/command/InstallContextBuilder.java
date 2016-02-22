package software.coolstuff.installapex.command;

import java.nio.file.Path;
import java.util.HashMap;
import java.util.Map;

import software.coolstuff.installapex.command.settings.CommandSettings;
import software.coolstuff.installapex.service.apex.parser.ApexApplication;

public class InstallContextBuilder {

  private int lineSize;
  private CommandSettings commandSettings;
  private String sqlPlusConnect;
  private long workspace;
  private ApexApplication apexApplication;
  private Path installationScript;

  public InstallContextBuilder() {}

  public InstallContextBuilder setLineSize(int lineSize) {
    this.lineSize = lineSize;
    return this;
  }

  public InstallContextBuilder setCommandSettings(CommandSettings commandSettings) {
    this.commandSettings = commandSettings;
    return this;
  }

  public InstallContextBuilder setSqlPlusConnect(String sqlPlusConnect) {
    this.sqlPlusConnect = sqlPlusConnect;
    return this;
  }

  public InstallContextBuilder setWorkspace(long workspace) {
    this.workspace = workspace;
    return this;
  }

  public InstallContextBuilder setApexApplication(ApexApplication apexApplication) {
    this.apexApplication = apexApplication;
    return this;
  }

  public InstallContextBuilder setInstallationScript(Path installationScript) {
    this.installationScript = installationScript;
    return this;
  }

  public Map<String, Object> build() {
    Map<String, Object> context = new HashMap<>();
    context.put("lineSize", lineSize);
    context.put("sqlPlusConnectWithoutPassword", commandSettings.getSQLPlusConnect());
    context.put("sqlPlusConnect", sqlPlusConnect);
    context.put("workspaceId", workspace);
    context.put("apexApplication", apexApplication);
    context.put("apexParameter", commandSettings.getApexParameter());
    context.put("installationScript", installationScript.getFileName());
    return context;
  }

}

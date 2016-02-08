package software.coolstuff.installapex.service.apex;

import java.util.Objects;

import org.apache.commons.lang.StringUtils;

public class ApexParameter {

  private boolean autoInstallSupportingObjects = true;
  private String imagePrefix;
  private String proxy;
  private String staticAppFilePrefix;
  private String staticPluginFilePrefix;
  private String staticThemeFilePrefix;
  private Integer sourceId;
  private boolean generateTargetId = true;
  private Integer targetId;
  private String workspace;
  private String schema;
  private boolean keepTargetOffset = true;
  private Long offset;
  private String alias;
  private String name;

  public boolean isAutoInstallSupportingObjects() {
    return autoInstallSupportingObjects;
  }

  public void setAutoInstallSupportingObjects(boolean autoInstallSupportingObjects) {
    this.autoInstallSupportingObjects = autoInstallSupportingObjects;
  }

  public String getImagePrefix() {
    return imagePrefix;
  }

  public void setImagePrefix(String imagePrefix) {
    this.imagePrefix = imagePrefix;
  }

  public String getProxy() {
    return proxy;
  }

  public void setProxy(String proxy) {
    this.proxy = proxy;
  }

  public String getStaticAppFilePrefix() {
    return staticAppFilePrefix;
  }

  public void setStaticAppFilePrefix(String staticAppFilePrefix) {
    this.staticAppFilePrefix = staticAppFilePrefix;
  }

  public String getStaticPluginFilePrefix() {
    return staticPluginFilePrefix;
  }

  public void setStaticPluginFilePrefix(String staticPluginFilePrefix) {
    this.staticPluginFilePrefix = staticPluginFilePrefix;
  }

  public String getStaticThemeFilePrefix() {
    return staticThemeFilePrefix;
  }

  public void setStaticThemeFilePrefix(String staticThemeFilePrefix) {
    this.staticThemeFilePrefix = staticThemeFilePrefix;
  }

  public void setSourceId(Integer sourceId) {
    this.sourceId = sourceId;
  }

  public Integer getSourceId() {
    return sourceId;
  }

  public boolean isSourceIdSpecified() {
    return sourceId != null;
  }

  public boolean isSourceIdNotSpecified() {
    return !isSourceIdNotSpecified();
  }

  public void setGenerateTargetId(boolean generateTargetId) {
    this.generateTargetId = generateTargetId;
  }

  public boolean isGenerateTargetId() {
    return generateTargetId;
  }

  public boolean isNotGenerateTargetId() {
    return !isGenerateTargetId();
  }

  public void setTargetId(Integer targetId) {
    this.targetId = targetId;
  }

  public Integer getTargetId() {
    return targetId;
  }

  public String getWorkspace() {
    return workspace;
  }

  public boolean isWorkspaceEmpty() {
    return StringUtils.isBlank(workspace);
  }

  public boolean isWorkspaceNotEmpty() {
    return !isWorkspaceEmpty();
  }

  public void setWorkspace(String workspace) {
    this.workspace = workspace;
  }

  public String getSchema() {
    return schema;
  }

  public void setSchema(String schema) {
    this.schema = schema;
  }

  public void setKeepTargetOffset(boolean keepTargetOffset) {
    this.keepTargetOffset = keepTargetOffset;
  }

  public boolean isKeepTargetOffset() {
    return keepTargetOffset;
  }

  public boolean isNotKeepTargetOffset() {
    return !isKeepTargetOffset();
  }

  public void setOffset(Long offset) {
    this.offset = offset;
  }

  public Long getOffset() {
    return offset;
  }

  public void setAlias(String alias) {
    this.alias = alias;
  }

  public String getAlias() {
    return alias;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getName() {
    return name;
  }

  @Override
  public int hashCode() {
    return Objects.hash(autoInstallSupportingObjects, imagePrefix, proxy, staticAppFilePrefix, staticPluginFilePrefix,
        staticThemeFilePrefix, sourceId, generateTargetId, targetId, workspace, schema, keepTargetOffset, offset, alias,
        name);
  }

  @Override
  public boolean equals(Object obj) {
    if (!(obj instanceof ApexParameter)) {
      return false;
    }
    ApexParameter otherObj = (ApexParameter) obj;
    return Objects.equals(autoInstallSupportingObjects, otherObj.autoInstallSupportingObjects)
        && Objects.equals(imagePrefix, otherObj.imagePrefix) && Objects.equals(proxy, otherObj.proxy)
        && Objects.equals(staticAppFilePrefix, otherObj.staticAppFilePrefix)
        && Objects.equals(staticPluginFilePrefix, otherObj.staticPluginFilePrefix)
        && Objects.equals(staticThemeFilePrefix, otherObj.staticThemeFilePrefix)
        && Objects.equals(sourceId, otherObj.sourceId) && Objects.equals(generateTargetId, otherObj.generateTargetId)
        && Objects.equals(targetId, otherObj.targetId) && Objects.equals(workspace, otherObj.workspace)
        && Objects.equals(schema, otherObj.schema) && Objects.equals(keepTargetOffset, otherObj.keepTargetOffset)
        && Objects.equals(offset, otherObj.offset) && Objects.equals(alias, otherObj.alias);
  }

}

CREATE TABLE apex_release (
  "VERSION_NO"        VARCHAR(4000)
 ,"API_COMPATIBILITY" VARCHAR(4000)
 ,"PATCH_APPLIED"     VARCHAR(4000)
);
CREATE TABLE apex_workspace_schemas (
  "WORKSPACE_ID"   INTEGER
 ,"WORKSPACE_NAME" VARCHAR(255)
 ,"SCHEMA"         VARCHAR(128)
);
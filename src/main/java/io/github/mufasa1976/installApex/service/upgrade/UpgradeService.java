package io.github.mufasa1976.installApex.service.upgrade;

import java.sql.Connection;

public interface UpgradeService {

  void update(Connection connection, UpgradeParameter parameter);

}

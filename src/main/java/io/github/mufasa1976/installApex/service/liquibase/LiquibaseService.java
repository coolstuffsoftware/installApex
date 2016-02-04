package io.github.mufasa1976.installApex.service.liquibase;

import java.sql.Connection;

public interface LiquibaseService {

  void update(Connection connection, LiquibaseParameter parameter);

}

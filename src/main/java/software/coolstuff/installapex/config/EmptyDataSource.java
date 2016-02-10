package software.coolstuff.installapex.config;

import java.io.PrintWriter;
import java.sql.Array;
import java.sql.Blob;
import java.sql.CallableStatement;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.NClob;
import java.sql.PreparedStatement;
import java.sql.SQLClientInfoException;
import java.sql.SQLException;
import java.sql.SQLFeatureNotSupportedException;
import java.sql.SQLWarning;
import java.sql.SQLXML;
import java.sql.Savepoint;
import java.sql.Statement;
import java.sql.Struct;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.Executor;
import java.util.logging.Logger;

import javax.sql.DataSource;

import net.sourceforge.cobertura.interaction.annotations.api.metrics.CoberturaIgnored;

@CoberturaIgnored
public class EmptyDataSource implements DataSource {

  @Override
  @CoberturaIgnored
  public PrintWriter getLogWriter() throws SQLException {
    return null;
  }

  @Override
  @CoberturaIgnored
  public void setLogWriter(PrintWriter out) throws SQLException {}

  @Override
  @CoberturaIgnored
  public void setLoginTimeout(int seconds) throws SQLException {}

  @Override
  @CoberturaIgnored
  public int getLoginTimeout() throws SQLException {
    return 0;
  }

  @Override
  @CoberturaIgnored
  public Logger getParentLogger() throws SQLFeatureNotSupportedException {
    return null;
  }

  @Override
  @CoberturaIgnored
  public <T> T unwrap(Class<T> iface) throws SQLException {
    return null;
  }

  @Override
  @CoberturaIgnored
  public boolean isWrapperFor(Class<?> iface) throws SQLException {
    return false;
  }

  @Override
  @CoberturaIgnored
  public Connection getConnection() throws SQLException {
    return new EmptyConnection();
  }

  @Override
  @CoberturaIgnored
  public Connection getConnection(String username, String password) throws SQLException {
    return new EmptyConnection();
  }

  @CoberturaIgnored
  private class EmptyConnection implements Connection {

    @Override
    @CoberturaIgnored
    public <T> T unwrap(Class<T> iface) throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public boolean isWrapperFor(Class<?> iface) throws SQLException {
      return false;
    }

    @Override
    @CoberturaIgnored
    public Statement createStatement() throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public PreparedStatement prepareStatement(String sql) throws SQLException {
      return null;
    }

    @Override
    public CallableStatement prepareCall(String sql) throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public String nativeSQL(String sql) throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public void setAutoCommit(boolean autoCommit) throws SQLException {}

    @Override
    @CoberturaIgnored
    public boolean getAutoCommit() throws SQLException {
      return false;
    }

    @Override
    @CoberturaIgnored
    public void commit() throws SQLException {}

    @Override
    @CoberturaIgnored
    public void rollback() throws SQLException {}

    @Override
    @CoberturaIgnored
    public void close() throws SQLException {}

    @Override
    @CoberturaIgnored
    public boolean isClosed() throws SQLException {
      return false;
    }

    @Override
    @CoberturaIgnored
    public DatabaseMetaData getMetaData() throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public void setReadOnly(boolean readOnly) throws SQLException {}

    @Override
    @CoberturaIgnored
    public boolean isReadOnly() throws SQLException {
      return false;
    }

    @Override
    @CoberturaIgnored
    public void setCatalog(String catalog) throws SQLException {}

    @Override
    @CoberturaIgnored
    public String getCatalog() throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public void setTransactionIsolation(int level) throws SQLException {}

    @Override
    @CoberturaIgnored
    public int getTransactionIsolation() throws SQLException {
      return 0;
    }

    @Override
    @CoberturaIgnored
    public SQLWarning getWarnings() throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public void clearWarnings() throws SQLException {}

    @Override
    @CoberturaIgnored
    public Statement createStatement(int resultSetType, int resultSetConcurrency) throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public PreparedStatement prepareStatement(String sql, int resultSetType, int resultSetConcurrency)
        throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public CallableStatement prepareCall(String sql, int resultSetType, int resultSetConcurrency) throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public Map<String, Class<?>> getTypeMap() throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public void setTypeMap(Map<String, Class<?>> map) throws SQLException {}

    @Override
    @CoberturaIgnored
    public void setHoldability(int holdability) throws SQLException {}

    @Override
    @CoberturaIgnored
    public int getHoldability() throws SQLException {
      return 0;
    }

    @Override
    @CoberturaIgnored
    public Savepoint setSavepoint() throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public Savepoint setSavepoint(String name) throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public void rollback(Savepoint savepoint) throws SQLException {}

    @Override
    @CoberturaIgnored
    public void releaseSavepoint(Savepoint savepoint) throws SQLException {}

    @Override
    @CoberturaIgnored
    public Statement createStatement(int resultSetType, int resultSetConcurrency, int resultSetHoldability)
        throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public PreparedStatement prepareStatement(String sql, int resultSetType, int resultSetConcurrency,
        int resultSetHoldability) throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public CallableStatement prepareCall(String sql, int resultSetType, int resultSetConcurrency,
        int resultSetHoldability) throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public PreparedStatement prepareStatement(String sql, int autoGeneratedKeys) throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public PreparedStatement prepareStatement(String sql, int[] columnIndexes) throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public PreparedStatement prepareStatement(String sql, String[] columnNames) throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public Clob createClob() throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public Blob createBlob() throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public NClob createNClob() throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public SQLXML createSQLXML() throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public boolean isValid(int timeout) throws SQLException {
      return false;
    }

    @Override
    @CoberturaIgnored
    public void setClientInfo(String name, String value) throws SQLClientInfoException {}

    @Override
    @CoberturaIgnored
    public void setClientInfo(Properties properties) throws SQLClientInfoException {}

    @Override
    @CoberturaIgnored
    public String getClientInfo(String name) throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public Properties getClientInfo() throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public Array createArrayOf(String typeName, Object[] elements) throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public Struct createStruct(String typeName, Object[] attributes) throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public void setSchema(String schema) throws SQLException {}

    @Override
    @CoberturaIgnored
    public String getSchema() throws SQLException {
      return null;
    }

    @Override
    @CoberturaIgnored
    public void abort(Executor executor) throws SQLException {}

    @Override
    @CoberturaIgnored
    public void setNetworkTimeout(Executor executor, int milliseconds) throws SQLException {}

    @Override
    @CoberturaIgnored
    public int getNetworkTimeout() throws SQLException {
      return 0;
    }

  }

}

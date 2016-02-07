package software.coolstuff.installapex.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;

import software.coolstuff.installapex.config.ApplicationConfiguration;

@Configuration
@Import(ApplicationConfiguration.class)
//@formatter:off
@PropertySources({
  @PropertySource("classpath:test_application.properties"),
  @PropertySource(value = "classpath:unversioned_test_application.properties", ignoreResourceNotFound = true)
})
//@formatter:on
public class TestApplicationConfiguration {

  @Bean
  public DataSource dataSource() {
    return new EmbeddedDatabaseBuilder().setType(EmbeddedDatabaseType.HSQL).build();
  }

}

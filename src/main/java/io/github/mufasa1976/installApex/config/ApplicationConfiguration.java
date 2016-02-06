package io.github.mufasa1976.installApex.config;

import java.io.IOException;
import java.io.PrintStream;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.GnuParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.core.io.ResourceEditor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.LazyConnectionDataSourceProxy;
import org.springframework.ui.velocity.VelocityEngineFactoryBean;

import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.OutputStreamAppender;
import io.github.mufasa1976.installApex.InstallApex;
import jline.console.ConsoleReader;
import jline.internal.Log;
import liquibase.database.DatabaseFactory;
import liquibase.resource.ClassLoaderResourceAccessor;
import liquibase.resource.ResourceAccessor;

@Configuration
@ComponentScan(basePackageClasses = InstallApex.class)
@PropertySource("classpath:application.properties")
@Import(LoggingConfiguration.class)
public class ApplicationConfiguration {

  private static final Logger log = LoggerFactory.getLogger(ApplicationConfiguration.class);

  @Value("${applicationConfiguration.terminal}")
  private String terminal;

  @Value("${applicationConfiguration.leftPadding}")
  private int leftPadding;

  @Value("${applicationConfiguration.descPadding}")
  private int descPadding;

  @Autowired
  private OutputStreamAppender<ILoggingEvent> appender;

  @Bean
  public static PropertySourcesPlaceholderConfigurer propertyPlaceholderConfigurer() {
    log.debug("Instantiate the Class {}", PropertySourcesPlaceholderConfigurer.class);
    PropertySourcesPlaceholderConfigurer configurer = new PropertySourcesPlaceholderConfigurer();
    return configurer;
  }

  @Bean
  public MessageSource messageSource() {
    ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
    messageSource.setBasename("messages");
    messageSource.setUseCodeAsDefaultMessage(true);
    return messageSource;
  }

  @Bean
  public ResourceEditor resourceEditor() {
    ResourceEditor resourceEditor = new ResourceEditor();
    return resourceEditor;
  }

  @Bean
  public CommandLineParser commandLineParser() {
    return new GnuParser();
  }

  @Bean
  public VelocityEngineFactoryBean velocityEngineFactoryBean() {
    VelocityEngineFactoryBean velocityEngineFactoryBean = new VelocityEngineFactoryBean();
    Properties properties = new Properties();
    properties.setProperty("resource.loader", "class");
    properties.setProperty("class.resource.loader.class", ClasspathResourceLoader.class.getName());
    velocityEngineFactoryBean.setVelocityProperties(properties);
    return velocityEngineFactoryBean;
  }

  @Bean
  public HelpFormatter helpFormatter() {
    HelpFormatter helpFormatter = new HelpFormatter();
    helpFormatter.setDescPadding(descPadding);
    helpFormatter.setLeftPadding(leftPadding);
    return helpFormatter;
  }

  @Bean
  public ResourceAccessor resourceAccessor() {
    return new ClassLoaderResourceAccessor();
  }

  @Bean
  public DatabaseFactory databaseFactory() {
    return DatabaseFactory.getInstance();
  }

  @Bean(destroyMethod = "shutdown")
  public ConsoleReader consoleReader() throws IOException {
    if (!System.getProperties().contains("jline.WindowsTerminal.input.encoding")) {
      if (System.getProperty("os.name").toLowerCase().startsWith("windows")) {
        System.setProperty("jline.WindowsTerminal.input.encoding", "IBM00858");
      } else {
        System.setProperty("input.encoding", "UTF-8");
      }
    }

    if (!System.getProperties().contains("jline.WindowsTerminal.output.encoding")) {
      if (System.getProperty("os.name").toLowerCase().startsWith("windows")) {
        System.setProperty("jline.WindowsTerminal.output.encoding", "IBM00858");
      } else {
        System.setProperty("jline.WindowsTerminal.output.encoding", "UTF-8");
      }
    }

    if (System.getProperties().contains("installApex.logLevel")) {
      String logLevel = System.getProperty("installApex.logLevel");
      if ("DEBUG".equalsIgnoreCase(logLevel)) {
        Log.setOutput(new PrintStream(appender.getOutputStream()));
        System.setProperty("jline.internal.Log.debug", "true");
      }
      if ("TRACE".equalsIgnoreCase(logLevel)) {
        Log.setOutput(new PrintStream(appender.getOutputStream()));
        System.setProperty("jline.internal.Log.trace", "true");
      }
    }

    ConsoleReader consoleReader = new ConsoleReader();
    return consoleReader;
  }

  @Bean
  public LazyConnectionDataSourceProxy lazyConnectionDataSourceProxy() {
    DataSource emptyDataSource = new EmptyDataSource();
    LazyConnectionDataSourceProxy lazyConnectionDataSourceProxy = new LazyConnectionDataSourceProxy(emptyDataSource);
    return lazyConnectionDataSourceProxy;
  }

  @Bean
  public JdbcTemplate jdbcTemplate() {
    return new JdbcTemplate(lazyConnectionDataSourceProxy());
  }

}

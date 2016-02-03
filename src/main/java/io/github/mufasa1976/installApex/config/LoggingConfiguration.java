package io.github.mufasa1976.installApex.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;

import ch.qos.logback.classic.encoder.PatternLayoutEncoder;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.Appender;
import ch.qos.logback.core.ConsoleAppender;
import ch.qos.logback.core.Context;
import ch.qos.logback.ext.spring.ApplicationContextHolder;

public class LoggingConfiguration {

  private static final Logger log = LoggerFactory.getLogger(LoggingConfiguration.class);

  @Value("${loggingConfiguration.layoutPattern}")
  private String layoutPattern;

  @Bean(name = "logback.applicationContextHolder")
  public static ApplicationContextHolder applicationContextHolder() {
    return new ApplicationContextHolder();
  }

  @Bean(name = "logback.loggingEncoder", initMethod = "start", destroyMethod = "stop")
  public PatternLayoutEncoder loggingEncoder() {
    PatternLayoutEncoder encoder = new PatternLayoutEncoder();
    encoder.setContext((Context) LoggerFactory.getILoggerFactory());
    encoder.setPattern(layoutPattern);
    return encoder;
  }

  @Bean(name = "logback.consoleAppender", initMethod = "start", destroyMethod = "stop")
  @Order(Ordered.HIGHEST_PRECEDENCE)
  public Appender<ILoggingEvent> consoleAppender(PatternLayoutEncoder encoder) {
    log.debug("Configuring the consoleAppender");
    ConsoleAppender<ILoggingEvent> appender = new ConsoleAppender<>();
    appender.setContext((Context) LoggerFactory.getILoggerFactory());
    appender.setEncoder(encoder);
    return appender;
  }

}

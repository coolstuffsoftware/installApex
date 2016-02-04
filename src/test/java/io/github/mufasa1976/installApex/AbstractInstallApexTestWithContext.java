package io.github.mufasa1976.installApex;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;

import io.github.mufasa1976.installApex.config.TestApplicationConfiguration;

@ContextConfiguration(classes = TestApplicationConfiguration.class)
public class AbstractInstallApexTestWithContext extends AbstractTestNGSpringContextTests {

}

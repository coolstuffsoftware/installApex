package software.coolstuff.installapex;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;

import software.coolstuff.installapex.config.TestApplicationConfiguration;

@ContextConfiguration(classes = TestApplicationConfiguration.class)
public class AbstractInstallApexTestWithContext extends AbstractTestNGSpringContextTests {

}

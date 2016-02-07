package software.coolstuff.installapex;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import software.coolstuff.installapex.InstallApex;
import software.coolstuff.installapex.config.ApplicationConfiguration;

public class TestInstallApex extends InstallApex {

  private static final Logger log = LoggerFactory.getLogger(TestInstallApex.class);

  public static void main(String[] args) {
    log.debug("Initialize the Application Context");
    @SuppressWarnings("resource")
    ApplicationContext context = new AnnotationConfigApplicationContext(ApplicationConfiguration.class);

    log.debug("Get the main Bean and execute");
    InstallApex main = context.getBean(InstallApex.class);
    System.exit(main.execute(args));
  }

}

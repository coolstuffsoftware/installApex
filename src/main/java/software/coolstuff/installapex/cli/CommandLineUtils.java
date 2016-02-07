package software.coolstuff.installapex.cli;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.jar.Attributes;
import java.util.jar.Manifest;

public final class CommandLineUtils {

  private final static String MANIFEST_LOCATION = "/META-INF/MANIFEST.MF";

  // this is only a Utility Class with static Methods
  private CommandLineUtils() {}

  public static String getSyntax(Class<?> clazz) {
    String className = clazz.getSimpleName() + ".class";
    String classPath = clazz.getResource(className).toString();
    if (!classPath.startsWith("jar")) {
      return "java " + clazz.getName();
    }
    String jarFile = classPath.substring(0, classPath.lastIndexOf('!'));
    jarFile = jarFile.substring(jarFile.lastIndexOf(File.separatorChar) + 1);
    String manifestPath = classPath.substring(0, classPath.lastIndexOf('!') + 1) + MANIFEST_LOCATION;
    try {
      Manifest manifest = new Manifest(new URL(manifestPath).openStream());
      Attributes attributes = manifest.getMainAttributes();
      String mainClass = attributes.getValue("Main-Class");
      if (clazz.getName().equals(mainClass)) {
        return "java -jar " + jarFile;
      } else {
        return "java -cp " + jarFile + " " + clazz.getName();
      }
    } catch (MalformedURLException e) {
      throw new IllegalArgumentException(String.format("Can't create the URL to read the own Manifest of Path %s",
          manifestPath), e);
    } catch (IOException e) {
      throw new IllegalStateException(String.format("Can't open the own Manifest of Path %s", manifestPath), e);
    }
  }
}

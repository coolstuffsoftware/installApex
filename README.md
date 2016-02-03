# runable JAR-Archive for Oracle APEX-Applications
The goal of this Project is to serve a framework to create a runable JAR-Archive with packed Oracle APEX-Applications. You can then install the packed APEX-Applications simply by calling ```java -jar installApex.jar --install``` on the Command-Line.

## Audience
This Project aims at Developers and/or DevOps, who wants to deploy Oracle APEX-Applications by a Command Line Tool. Preferably the Target is a APEX Runtime Only Environment (without the Development Installation).

## How to build
### Prerequisites
Because this Project needs a Reference to the [ojdbc7.jar (Oracle JDBC Driver)](http://www.oracle.com/technetwork/database/features/jdbc/default-2280470.html) this JAR-Archive must be installed manually to the local Maven Repository
```
mvn install:install-file -Dfile=ojdbc7.jar -DgroupId=com.oracle -DartifactId=ojdbc7 -Dversion=12.1.0.2 -Dpackaging=jar
```
Furthermore, to run the Tests successfully, [SQL*Plus](http://www.oracle.com/technetwork/database/features/instant-client/index-097480.html) must be installed on the Build Machine.

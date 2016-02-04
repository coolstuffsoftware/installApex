# runable JAR-Installer for Oracle APEX-Applications
The goal of this Project is to serve a framework to create a runable JAR-Archive with packed Oracle APEX-Applications. You can then install the packed APEX-Applications simply by calling ```java -jar installApex.jar --install``` on the Command-Line.

## Audience
This Project aims at Developers and/or DevOps, who wants to deploy Oracle APEX-Applications by a Command Line Tool. Preferably the Target is a APEX Runtime Only Environment (without the Development Installation).

## How to build the Project
### Prerequisites
Because this Project needs a Reference to the [ojdbc7.jar (Oracle JDBC Driver)](http://www.oracle.com/technetwork/database/features/jdbc/default-2280470.html) this JAR-Archive must be installed manually to the local Maven Repository
```
mvn install:install-file -Dfile=ojdbc7.jar -DgroupId=com.oracle -DartifactId=ojdbc7 -Dversion=12.1.0.2 -Dpackaging=jar
```
Furthermore, to run the Tests successfully, [SQL*Plus](http://www.oracle.com/technetwork/database/features/instant-client/index-097480.html) must be installed on the Build Machine.

## How to package the APEX-Application
### File Structure
The following File-Structure is recommended:
```
.
├─ pom.xml / build.gradle
└─ src
   └─ main
      └─ resources
         ├─ liquibase
         │  ├─ db.changelog-master.xml
         │  └─ plsql
         │     ├─ db.changelog-plsql.xml
         │     ├─ PKG_PACKAGE1.pks
         │     ├─ PKG_PACKAGE1.pkb
         |     └─ ...
         └─ apex
            ├─ f100.sql
            └─ f101/
               ├─ install.sql
               └─ application
                  ├─ init.sql
                  ├─ set_environment.sql
                  ├─ ...
                  └─ pages
                     ├─ page_00000.sql
                     ├─ page_00001.sql
                     └─ ...
                  
```
Extract all your APEX-Applications you wish to package into the Subdirectory ```src/main/resources/apex```. You can also use the [Apex Splitter](https://ruepprich.wordpress.com/2011/07/15/exporting-an-apex-application-via-command-line/) to split your APEX-Application.

All DDL and PL/SQL will be maintaned by [Liquibase](http://liquibase.org/). Please refer to their Documentation. Following the best Practices of Liquibase the Master-File should be named  ```db.changelog-master.xml```. All Liquibase ChangeLog Files must resist within the Directory ```src/main/resources/liquibase```.
### Versioning you APEX-Applications
By setting the Version of your APEX-Application to the Value ```${project.version}``` the maven-shade-plugin will substitute this String by the actual Version of your Project.
### Maven
Within the ```pom.xml``` define the following Dependencies and Plugins:
```
...
<dependencies>
    ...
    <dependency>
        <groupId>io.github.mufasa1976</groupId>
        <artifactId>installApex</artifactId>
        <version>1.0.0</version>
    </dependency>
    <dependency>
        <groupId>com.oracle</groupId>
        <artifactId>ojdbc7</artifactId>
        <version>12.1.0.2</version>
    </dependency>
    ...
</dependencies>
...
<build>
    ...
    <plugins>
        ...
        <plugin>
            <artifactId>maven-shade-plugin</artifactId> 
            <version>2.4</version>
            <executions>
                <execution>
                    <id>shade</id>
                    <phase>package</phase>
                    <goals>
                        <goal>shade</goal>
                    </goals>
                    <configuration>
                        <finalName>${project.artifactId}</finalName>
                        <transformers>
                            <transformer implementation="org.apache.maven.plguins.shade.resource.ManifestResourceTransformer">
                                <mainClass>io.github.mufasa1976.installApex.InstallApex</mainClass>
                            </transformer>
                        </transformers>
                    </configuration>
                </execution>
            </executions>
        </plugin>
        ...
    </plugins>
    ...
</build>

```
Of course you have to install the requested Dependencies into your local Repository first:
```
mvn install:install-file -Dfile=ojdbc7.jar -DgroupId=com.oracle -DartifactId=ojdbc7 -Dversion=12.1.0.2 -Dpackaging=jar
mvn install:install-file -Dfile=installApex.jar -DgroupId=io.github.mufasa1976 -DartifactId=installApex -Dversion=1.0.0 -Dpackaging=jar
```
Now you run ```mvn package``` and then you got the final JAR-Installer in your target Directory.
## Run the Install
### Debugging
You can set the Debug-Level by setting the System-Property ```installApex.logLevel``` to a valid SLF4J LogLevel (i.e. ```DEBUG```, ```ERROR```, ...)
```
java -DinstallApex.logLevel=DEBUG -cp $ORACLE_HOME/jdbc/lib/ojdbc7.jar -jar installApex.jar
```
All Logs will be redirected to Standard Output (stdout). If you want to redirect it to a File then simply set the System-Property ```installApex.logFile```:
```
java -DinstallApex.logLevel=DEBUG -DinstallApex.logFile=logs.txt -cp $ORACLE_HOME/jdbc/lib/ojdbc7.jar -jar installApex.jar
```
If the Log-File already exists the Content will simply appended.

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
```xml
...
<dependencies>
    ...
    <dependency>
        <groupId>software.coolstuff</groupId>
        <artifactId>installapex</artifactId>
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
    <resources>
        <resource>
            <directory>src/main/resources</directory>
            <filtering>false</filtering>
            <includes>
                <include>**/*</include>
            </includes>
            <excludes>
                <exclude>apex/f*/application/create_application.sql</exclude>
                <exclude>apex/f*.sql</exclude>
            </excludes>
        </resource>
        <resource>
            <directory>src/main/resources</directory>
            <filtering>true</filtering>
            <includes>
                <include>apex/f*/application/create_application.sql</include>
                <include>apex/f*.sql</include>
            </includes>
        </resource>
    </resources>
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
                                <mainClass>software.coolstuff.installapex.InstallApex</mainClass>
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
mvn install:install-file -Dfile=installApex.jar -DgroupId=software.coolstuff -DartifactId=installapex -Dversion=1.0.0 -Dpackaging=jar
```
Now you run ```mvn package``` and then you got the final JAR-Installer in your target Directory.
### Liquibase
Liquibase will be used to version the Database-Scripts. Instead of writing Initial Install and afterwards Upgrade-Scripts (more or less a bloodcurling Piece of Work)
you can write it with a nice XML-Editor (i.E. XML-Spy) and let Liquibase the Decision, which Statements to execute against the Target Database.

As mentioned above please refer to the richful Documentation of [Liquibase](http://liquibase.org). But here are some rules, which will guide you through the Creation of Liquibase Changelog-Files working correctly with this Framework
#### use logical File Name
You can also use the Liquibase Maven-Plugin to test your XML-Scripts within a Continuous Integration Landscape (Development - Test). As the Documentation of Liquibase tells:

> Each changeSet tag is uniquely identified by the combination of the “id” tag, the “author” tag, and the changelog file classpath name.

Taking the last part of this (the changelog file classpath name) the behaviour between Maven and a packaged Liquibase File differs a little by evaluating the classpath filename.
Maybe I was wrong by the usage of the Maven-Plugin, but Maven tends to write the **Full Pathnames** while the packaged Liquibase use **relative Pathnames**. But Liquibase has another
3rd version of calculating the classpath file name: the *logical File Name*. You can set the logical Filename as an attribute of the ```<databaseChangeLog>``` Tag.
```xml
<databaseChangeLog
  logicalFilePath="/2015/db.changelog-ddl.xml"
  xmlns="http://www.liquibase.org/xml/ns/dbchangelog"
  xmlns:ext="http://www.liquibase.org/xml/ns/dbchangelog-ext"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="
    http://www.liquibase.org/xml/ns/dbchangelog-ext
    http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-ext.xsd
    http://www.liquibase.org/xml/ns/dbchangelog
    http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-3.4.xsd
  ">
  ...
</databaseChangeLog>
```
Now Liquibase calculates the classpath file name by this logical File Name and writes it to the Database ChangeLog Table.
#### classpath references
As you can see above, the Liquibase-Files must reside under the Directory ```liquibase```. To get the same behaviour between a Maven Build and the
packaged Liquibase Application you should use classpath references when calling external SQL-Files.
```
<changeSet author="mufasa1976@some.where" id="something-to-install">
    <sqlFile encoding="UTF8" splitStatements="false" path="liquibase/plsql/PRC_USE_THIS.prc" />
    <rollback>
        <dropProcedure procedureName="PRC_USE_THIS" />
    </rollback>
</changeSet>
```
By setting always the full Path from the beginning of the Classpath **without a leading Slash** (by only prefixing with ```liquibase/```) you can
be sure that the maven plugin and the packaged Application will work the same.
#### using relativeToChangelogFile
On the Tags ```<include>``` and ```<sqlFile>``` you can use the attribute ```relativeToChangelogFile```. To be sure that the maven-plugin and the packaged
Application will have the same behaviour use ```relativeToChangelogFile``` **only with ```<include>```**.
### Liquibase ChangeLog Table
By Default Liquibase will create a Table name ```DATABASECHANGELOG``` within the Schema you're logged on. While this behaviour is what you want in 80% chances are good you want something other. When you set another Installation-Schema by the Command-Line Option ```--installSchema``` (or simply ```-s```) the Liquibase Changelog Table (and the Changelog Lock Table) will be created within this Schema. But you can also create the Table within a completly other Schema by setting the Command-Line Option ```--changeLogSchemaName```. The the Liquibase ChangeLog Table and the Liquibase ChangeLog Lock Table will be created within this Database Schema.
### additional Liquibase Parameter
Liquibase has a powerful Feature: *Changelog Parameters*. By Default, no Changelog Parameters will be set by Liquibase itself. But the InstallAPEX Framework
will set a handful of meaningful Changelog Parameters so that they can be used within the Liquibase Changelog Files:
- ```databaseChangeLogFileName```<br/>The Name of the ChangeLog File
- ```databaseChangeLogTableName```<br/>The Name of the requested ChangeLog Table (Value of the Command Line Option ```--changeLogTableName``` or the Default of Liquibase ```DATABASECHANGELOG```)
- ```databaseChangeLogLockTableName```<br/>The Name of the requested Changelog Lock Table (Value of the Command Line Option ```--changeLogLockTableName``` or the Default of Liquibase ```DATABASECHANGELOGLOCK```)
- ```defaultSchemaName```<br/>The Name of the default Schema (Value of the Command Line Option ```--installSchema```)
- ```defaultSchemaNameWithDot```<br/>The Name of the default Schema followed by a . (Dot). If the Command Line Option ```--installSchema``` has not been set (as this is the Value of this Changelog Parameter) then an empty String will be injected instead.
- ```liquibaseSchemaName```<br/>The Schema, where the Changelog Table should be created (Value of the Command Line Option ```--changeLogSchemaName```)
- ```liquibaseTablespaceName```<br/>Tablespace, where the ChangeLog Table should be created (Value of the Command Line Option ```--changeLogTablespaceName```)

For example, you can create the following SQL-File:
```plsql
CREATE OR REPLACE FUNCTION ${defaultSchemaName}.fct_hello_world IS
BEGIN
  RETURN 'Hello World';
END fct_hello_world;
```
When you run the Installer, ```${defaultSchemaName}``` will be exchanged by the Value of the Command Line Option ```--installSchema```.<br/>
**Caution:** A missing Command Line Option ```--installSchema``` will lead to a wrong SQL-Statement (```.fct_hello_world``` instead of ```fct_hello_world```).
To bypass this Problem you should use ```${defaultSchemaNameWithDot}``` instead of ```${defaultSchemaName}```. So the Example above should look like the following:
```plsql
CREATE OR REPLACE FUNCTION ${defaultSchemaNameWithDot}fct_hello_world IS
BEGIN
  RETURN 'Hello World';
END fct_hello_world;
```
### additional Liquibase Parameter with Liquibase Maven Plugin
The Maven Plugin of Liquibase doesn't know anything about this Framework. So you have to simulate the automatically injected Changelog Parameters by using the Expression Values of the Liquibase Maven Plugin:
```xml
<project>
    ...
    <properties>
        <jdbc.user.name>SCOTT</jdbc.user.name>
    </properties>
    ...
    <build>
        ...
        <plugins>
            ...
            <plugin>
                <groupId>org.liquibase</groupId>
                <artifactId>liquibase-maven-plugin</artifactId>
                <version>3.4.1</version>
                <configuration>
                    <expressionVariables>
                        <defaultSchemaName>${jdbc.user.name}</defaultSchemaName>
                        <defaultSchemaNameWithDot>${jdbc.user.name}.</defaultSchemaNameWithDot>
                    </expressionVariables>
                </configuration>
                ...
            </plugin>
            ...
        </plugins>
        ...
    </build>
    ...
</project>
```
### Application-ID as Liquibase Contexts
You can set the Application-ID as a Liquibase Context so that some ChangeLogs will only be created when this Application will be installed (or the DDL will be extracted).
The InstallAPEX Framework will automatically set the Application-ID specified by the Command Line Option ```--sourceId``` as a Liquibase Context. If only one APEX-Application has been
packaged you can ommit this Command Line Option and the Application-ID will be also set.
## filtering Resources on Maven
Maven will replace any known Variales (```${}```). This is for Java-Projects a good behaviour because any external Resources (like Configuration Files, ...) will be advantaged.
But for PL/SQL Code this behaviour is a great disadvantage (for Example packaged JavaScript Code, etc).

You can disable this Feature within the Maven ```pom.xml```:
```xml
<project>
    ...
    <build>
        ...
        <resources>
            <resource>
                <directory>src/main/resources</directory>
                <filtering>false</filtering>
                <includes>
                    <include>**/*</include>
                </includes>
                <excludes>
                    <exclude>apex/f*/application/create_application.sql</exclude>
                    <exclude>apex/f*.sql</exclude>
                </excludes>
            </resource>
            <resource>
                <directory>src/main/resources</directory>
                <filtering>true</filtering>
                <includes>
                    <include>apex/f*/application/create_application.sql</include>
                    <include>apex/f*.sql</include>
                </includes>
            </resource>
        </resources>
        ...
    </build>
    ...
</project>
```
Why would the Files ```apex/f*/application/create_application.sql``` and ```apex/f*.sql``` be filtered? Because, when you set the Value of the APEX-Application Version to ```${project.version}``` you want Maven to replace this by the Version of the Project (i.e. 1.0.0-SNAPSHOT). You might suggest that Variable Replacement for this is also not meaningful? So, you are right. I think, the best Way to store an APEX-Application within a Source Control is by its splitted kind. This is the Reason why ```apex/f*/application/create_application.sql``` is included by the Resource filtering of Maven. This File calls the stored Procedure ```WWV_FLOW_API.create_flow``` which creates the APEX-Application Basics with the Version (Parameter: ```p_flow_version```). So enabling filtering only to this File and disable filtering on all the other APEX Files will lead to the wished behaviour, that the Version will be maintained by Maven (or by the Release-Plugin of Maven). From this Point of View my recommendation is
> Always Split the APEX File when you save it to the SCM.

With a splitted APEX-Application you have the following Advantages:
- Change Tracking by Pages/Plugins/...
- reduced Review Activity (only focus on the changed Files instead of one large File)
- Maven Resource filtering on only one File (```apex/f*/application/create_application.sql```, look above)
- any SCM Tracking Tool within an Issuing System (GIT Plugin for JIRA, SVN Plugin for Bugzilla, etc) will reduce the Review Load
(have you ever got an Error from the GIT Plugin that this File changes are too large to be loaded?)

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
### print Stacktrace
This Framework provides a single Exception-Class for Output: ```InstallApexException```. This keeps Error-Handling simple and effective because the Errors produced by this Framework are channeled through Reason-Codes with the Prefix ```INST-```.
It depends on this Reason-Code if the thrown Exception will print its StackTrace. By setting the System-Property ```installApex.alwaysPrintStackTrace``` (```-DinstallApex.alwaysPrintStackTrace```) all thrown Exceptions will print
their StackTraces
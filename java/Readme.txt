Steps to use:

1) Enter the location of <tomcat_home> which contains tomcat installtion for which multiple instances are to be created.

2) The tool needs to copy some files and folders from the source tomcat to create multiple instances. You need to specify a directory where you will see diectories being created corresponding to each tomcat instance.
If the location specified in this step doesn't exist, the tool can create it for you.

3) Specify  the number of instances to be created from the source tomcat

4) There are three port numbers which have to be separate for each tomcat instance and the user needs to provide the port values for:
a) HTTP Connector: This is the port which will be used for listening the HTTP requests
b) AJP port: This is the port where the communication between tomcat and and any other web server can happen using the AJP protocol
c) Shutdown port : This is the port where tomcat listens for shutdown events.
You can use the numbers similar to the default values. For e.g. default value for HTTP connector port is 8080 and one can use 5050. Default value for AJP connector port is 8009 and one can use 5009, default value for shutdown port is 8005 and one can use 5005

5) Once all the requied information has been entered, the tool will do some file operations and hence can take some time to perform the job. Once the setup is done, you will get success message

6) The tool gives error messages when it can not proceed further.

Instructions for *nix users:

1) Install Java using the following tutorial
http://openjdk.java.net/install/

2) Download tomcat as zip file and then extract the same. Make sure proper access rights are set on the extracted folder by executing the command:
sudo chmod 755 -R <tomcat_home>/*

3) Use this tool as administrator/root in linux to avoid file permission issues.

4) Right click the TomcatInstances.jar file, go to properties and check the "Allow executing file as program" checkbox in Permissions tab.

5) Right click the TomcatInstances.jar file and choose open with Java Runtime and set the same as default for the first time. Next time onwards, double clicking the TomcatInstances.jar file will run the utility.

6) If you are unable to run the utility by double clicking, use the command java -jar ./TomcatInstances.jar from the folder containing the jar

7) Once the instances have been created for source tomcat, use the following command to set proper file permissions:
sudo chmod 755 -R <tomcat_instance>/*

8) Use the following command to start tomcat instance :
a) cd <tomcat_instance>/bin
b) sudo sh ./startup.sh


9) The presence of CATALINA_HOME enviornemnt variable has no effect on this tool. There is no need to set CATALINA_HOME for running the instances created  by this tool as the env. variable part is handled internally

10) The tomcat versions supported by this utility are Tomcat 6 and Tomcat 7. Tomcat 5 has already reached EOL (end of life)


Instructions for windows users:

1) Install JDK

2) Download tomcat as zip file and then extract the same.

3) Use the tool as administartor/root in windows to avoid file permission issues.

4) Double clicking the TomcatInstances.jar file will run the utility.

5) If you are unable to run the utility by double clicking, use the command java -jar ./TomcatInstances.jar from the folder containing the jar

6) The utility is not tested on the windows installer of tomcat.

7) The presence of CATALINA_HOME enviornemnt variable has no effect on this tool. There is no need to set CATALINA_HOME for running the instances created  by this tool as the env. variable part is handled internally

8) To start a particular tomcat instance, go to the <tomcat_instance>/bin directory and double click startup.bat file

9) The tomcat versions supported by this utility are Tomcat 6 and Tomcat 7. Tomcat 5 has already reached EOL (end of life)


TODO:

1) Currently the utility changes port for HTTP and will not be able to create instances if Thread pool and SSL has been enabled in the source tomcat. ThreadPool and SSL support can be considered in future.

2) This tool is tested against zipped versions of Tomcat 6 and Tomcat 7, need to test the tool against Tomcat installer.

3) Command line arguments and properties file can also be accepted instead of input dialogs.
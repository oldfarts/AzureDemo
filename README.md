# AzureDemo
AzureDemoWithJavaForJenkins

Migration project for Access 97 DB to Azure cloud (Sql server)
1.) Downloand http://www.trisunsoft.com/access-password-recovery/ to clear the password from Access 97 DB
2.) Donwload xBaseView Database Explorer 11.0.2.1029 to see the missing drivers
3.) Open the Microsoft SQL Server export and Import 2016 (32-bit) to make a conversion to existing 2016 DB from Access 97
tadaa! :D
4.) Create Azure cloud server and log in
5.) Export data from SQL Server management to azure via Import (under the task command at DB)

Notes! Access 97 DB had own UI but it was not exported during the migration!

Optional:
6.) Install eclipse and Azure cloud publishing - see the video on https://channel9.msdn.com/Blogs/Interoperability/Java-Applications-in-Windows-Azure-Cloud-Services-using-Eclipse
+ https://dzone.com/articles/creating-hello-world
7.) Publish the 1st Java app to Azure cloud

Example output:
E:\Ohjelmointi\>java connectdb
Connecting to database...
Creating statement...
Jani
Janne
Kalevi
Juha
Juoppo
Jani
Goodbye!

#Feel free to send me comments - jarvas77@hotmail.com

cd /var/lib/jenkins/workspace/Robottiroo/commons/
gradle build
cd ..
cd robohandler
gradle build
cd ..
cd hotkeyhelper
gradle build
cd ..
cd machinelearning
gradle build
cd ..
cd mainlauncher
gradle build
cd ..
cd processmanager
gradle build
cd ..
cd testrunner4j
gradle build
cd ..
cd webtester
gradle build
cd ..
cd apitester
gradle build
cd ..
cd chatbot_core
gradle build
cd ..
cd robolocli
gradle build
cd ..
cd worksim
gradle build
cd ..
cd chatbot_rikinveli
gradle build
cd ..
cd chatbot_rboceo
gradle build
cd ..
cd ircbot_legacy
gradle build
cd ..
cd ircbot_platform
gradle build
cd ..
cd projectcreator
gradle build
cd ..
cd rjsxbuiler
gradle build
cd ..
cd myinternet
gradle build
cd ..
cd robosdk
gradle build
cd ..
cd codeanalyzer
gradle build
cd ..
cd robottiyliherra
gradle build
cd ..

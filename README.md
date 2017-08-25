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


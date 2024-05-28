
user name and password  

regular email: temptaiyang@gmail.com 
regular password: password1
admin email: lisalisa@gmail.com
admin password: password1

# Online Booking System

The Online Booking System for a Tai Yang clinic simplifies appointment scheduling, allowing clients to book their preferred time slots conveniently. It improves the user experience and enhances appointment management efficiency through an online interface.


## Authors

- [@Seunggyu Park]



## Deployment

#### Prerequisites : 

Before deploying the project, ensure you have the following prerequisites:

AWS Account: Create an AWS account to provision the necessary resources. 

AWS EC2: Set up an EC2 instance to host your application.

AWS RDS: Create an RDS instance for your database.

Git Bash: Install Git Bash to clone the project repository and execute Git commands.

FileZilla: Install FileZilla for transferring files to the server or hosting environment



#### Configuration: 

Configure the security groups on your EC2 instance with the following settings:

Set up the security grous on EC2
- 8080 : tomcat server 
- 3306 : mysql port
- 80 : http



#### Install dependencies:

1. Open Gitbash
2. Connect to ip address

``` ssh -i keypairpath ubuntu@ec2 ip address ```

3. Install JDK

``` 
sudo apt-get update
sudo apt-get install openjdk-8-jdk 
```

4. Install tomcat server 

```
wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.27/bin/apache-tomcat-8.0.27.tar.gz
-unzip
tar -zvxf apache-tomcat-8.0.27.tar.gz
```



#### Database setup:

1) Download the MySQL repository

``` wget https://dev.mysql.com/get/mysql-apt-config_0.8.12-1_all.deb ```

2) After the MySQL package has been successfully downloaded, install it
``` sudo dpkg -i mysql-apt-config_0.8.12-1_all.deb ```

3) select ubuntu bionic -  MySQL Server & Cluster option - select mysql-5.7 -select Ok

4) update the APT repository
``` sudo apt update```

5) If you encounter the "signature couldn't be verified" error like this one: NO_PUBKEY 467B942D3A79BD29, you will need to import the missing gpg key by running the following command:

``` sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 467B942D3A79BD29 ```

6) execute the apt update again:
``` sudo apt update ```

7) Now that you have a MySQL 5.7 repository in your system, you can proceed to install it. For this, run the following command:

``` sudo apt install -f mysql-client=5.7* mysql-community-server=5.7* mysql-server=5.7* ``` 

Reference: https://www.devart.com/dbforge/mysql/how-to-install-mysql-on-ubuntu/ 



#### Connect RDS and Mysql:

To connect your project with the RDS instance, follow these steps:

Set up a new connection in the MySQL workbench.

1. Fill in the required fields based on the information provided when you created the RDS instance.
- HostName: Endpoint in RDS.

2. Click on 'Test Connection' to verify the connection.

3. If the connection is successful, click 'OK' to save the configuration.




#### Uploading the project 

To upload and deploy the project on the server, follow these steps:

1. In Netbeans, create a .war file for the project.

2. Connect to the server using FileZilla.

3. Upload the .war file to the "webapps" folder within the Tomcat installation directory.

4. Test if the project is working correctly:

Navigate to the Tomcat installation directory on the server using the command

``` cd tomcat path/bin ```

5. Start the Tomcat server by executing the following command:

``` ./startup.sh ``` 

6. To stop the server, run the following command:

``` ./shutdown.sh  ```







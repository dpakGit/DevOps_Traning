Let's break down each command and its attributes.

Step 1: Update the package list

     sudo apt update

- sudo: Superuser do, allows you to run commands with superuser privileges.
- apt: Advanced Package Tool, a package manager for Ubuntu.
- update: Updates the package list to ensure you have the latest package information.
  This command updates the package list, ensuring you have the latest information about available packages.

Step 2: Install Java 17 (required by Jenkins)

    sudo apt install openjdk-17-jdk -y

- install: Installs a package and its dependencies.
- openjdk-17-jdk: The package name for Java 17 Development Kit.

This command installs Java 17, which is required by Jenkins.

Step 3: Verify Java installation

    java -version

- java: The Java command-line tool.
- -version: Displays the version of Java installed.

This command verifies that Java 17 is installed correctly.


Step 4: Add the Jenkins repository key

     wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

- wget: A command-line tool for downloading files.
- -q: Quiet mode, suppresses output.
- -O -: Outputs the downloaded file to stdout.
- https://pkg.jenkins.io/debian-stable/jenkins.io.key: The URL of the Jenkins repository key.
- |: Pipes the output to the next command.
- sudo apt-key add -: Adds the key to the list of trusted keys.

This command adds the Jenkins repository key to your system, ensuring package authenticity.


Step 5: Add the Jenkins repository

     sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

- sh -c: Executes a command in a shell.
- echo: Outputs the string "deb https://pkg.jenkins.io/debian-stable binary/".
- >: Redirects the output to a file.
- /etc/apt/sources.list.d/jenkins.list: The file where the repository information is stored.

This command adds the Jenkins repository to your system's package sources.


Step 6: Update the package list again

     sudo apt update # (again)

This command updates the package list again, ensuring you have the latest information about available packages, including Jenkins.


Step 7: Install Jenkins

     sudo apt install jenkins -y

This command installs Jenkins and its dependencies.


Step 8: Start the Jenkins service

     sudo systemctl start jenkins

- systemctl: A command-line tool for managing systemd services.
- start: Starts a service.
- jenkins: The service name.

This command starts the Jenkins service.

Step 9: Enable Jenkins to start automatically on boot
     
     sudo systemctl enable jenkins

- enable: Enables a service to start automatically on boot.

This command enables Jenkins to start automatically on boot.


Step 10: Check the Jenkins service status


     sudo systemctl status jenkins

- status: Displays the status of a service.

This command checks the Jenkins service status.



Step 11: Access Jenkins

By default, Jenkins listens on port 8080. You can access Jenkins by navigating to http://localhost:8080 in your web browser. If you're running Ubuntu on a remote server, replace localhost with the server's IP address.


     http://localhost:8080:      # The default URL for accessing Jenkins.

OR , If you have installed jenkins on an Ec2 instance, navigate to `<EC2 instance's public IP address>:8080` in your web browser.

You can access Jenkins by navigating to this URL in your web browser.

Step 12: Initial password:

During the initial setup, Jenkins will ask for an initial password. You can find this password in the following file:

     sudo cat /var/lib/jenkins/secrets/initialAdminPassword

- Run this command on the terminal where jenkins is installed.
- Copy and paste this password into the Jenkins setup wizard to proceed with the installation.


- cat: Displays the contents of a file.
- /var/lib/jenkins/secrets/initialAdminPassword: The file containing the initial admin password.

This command displays the initial admin password required for the Jenkins setup wizard.



### To access Jenkins running on an AWS EC2 instance, you'll need to configure the inbound rules for the instance's security group. Here's what you should do ¹ ²:
- Type: Custom TCP
- Protocol: TCP
- Port Range: 8080 (default port for Jenkins)
- Source: Anywhere-IPv4 (0.0.0.0/0) or specify a custom IP address/range for added security

Here's a step-by-step guide to set up the inbound rule:
1. Go to your EC2 instance and click on "Security" in the details tab.
2. Click on the security group associated with your instance.
3. Navigate to the "Inbound rules" tab and click "Edit inbound rules."
4. Click "Add rule" and enter the details mentioned above.
5. Save the changes.

With this configuration, you'll be able to access Jenkins using the public IP address of your EC2 instance followed by port 8080, like this: http://your-ec2-public-ip:8080. Make sure to replace your-ec2-public-ip with the actual public IP address of your instance.

- sudo systemctl status jenkins command will give the following output
<img width="1920" height="1080" alt="Screenshot (143)" src="https://github.com/user-attachments/assets/2953a76c-cf90-4ca1-9472-43714a372a80" />

<img width="1920" height="1080" alt="Screenshot (144)" src="https://github.com/user-attachments/assets/ba595dfc-9141-4b08-9df7-fd11030b711b" />

- from the "Jenkins status" output copy the initial admin password (e.g:92d1d22d9dd84b80a2b43ba1a86cd95d) or ru the following cat command `cat /var/lib/jenkins/secrets/initialAdminPassword` the output of this will also give the initial admin password. Copy it and paste it in the below box.
<img width="1920" height="1080" alt="Screenshot (145)" src="https://github.com/user-attachments/assets/c01d58d5-4d29-4046-b4d3-326fd7258ef6" />

- Click on "Install Suggested Plugins"
  
<img width="1920" height="1080" alt="Screenshot (146)" src="https://github.com/user-attachments/assets/ab2d5f36-16d2-43e0-837a-7bcc6d4afd61" />

- 

<img width="1920" height="1080" alt="Screenshot (147)" src="https://github.com/user-attachments/assets/c83b41dd-4ebf-4136-887a-b98c4270e05a" />

<img width="1920" height="1080" alt="Screenshot (148)" src="https://github.com/user-attachments/assets/06d2eca3-56bc-412d-943a-c510931b689c" />

<img width="1920" height="1080" alt="Screenshot (149)" src="https://github.com/user-attachments/assets/65c1918f-7867-43a2-a827-14060c447ed5" />


![Uploading Screenshot (150).png…]()

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/c11a3892-b53b-46a9-9365-d78cc7bed672" />


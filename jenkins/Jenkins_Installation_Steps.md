Let's break down each command and its attributes.

*1. Step 1: Update the package list

    - sudo apt update

- sudo: Superuser do, allows you to run commands with superuser privileges.
- apt: Advanced Package Tool, a package manager for Ubuntu.
- update: Updates the package list to ensure you have the latest package information.

This command updates the package list, ensuring you have the latest information about available packages.

*2. sudo apt install openjdk-17-jdk*

- install: Installs a package and its dependencies.
- openjdk-17-jdk: The package name for Java 17 Development Kit.

This command installs Java 17, which is required by Jenkins.

*3. java -version*

- java: The Java command-line tool.
- -version: Displays the version of Java installed.

This command verifies that Java 17 is installed correctly.

4. wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

- wget: A command-line tool for downloading files.
- -q: Quiet mode, suppresses output.
- -O -: Outputs the downloaded file to stdout.
- https://pkg.jenkins.io/debian-stable/jenkins.io.key: The URL of the Jenkins repository key.
- |: Pipes the output to the next command.
- sudo apt-key add -: Adds the key to the list of trusted keys.

This command adds the Jenkins repository key to your system, ensuring package authenticity.

5. sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

- sh -c: Executes a command in a shell.
- echo: Outputs the string "deb https://pkg.jenkins.io/debian-stable binary/".
- >: Redirects the output to a file.
- /etc/apt/sources.list.d/jenkins.list: The file where the repository information is stored.

This command adds the Jenkins repository to your system's package sources.

*6. sudo apt update (again)*

This command updates the package list again, ensuring you have the latest information about available packages, including Jenkins.

*7. sudo apt install jenkins*

This command installs Jenkins and its dependencies.

*8. sudo systemctl start jenkins*

- systemctl: A command-line tool for managing systemd services.
- start: Starts a service.
- jenkins: The service name.

This command starts the Jenkins service.

*9. sudo systemctl enable jenkins*

- enable: Enables a service to start automatically on boot.

This command enables Jenkins to start automatically on boot.

*10. sudo systemctl status jenkins*

- status: Displays the status of a service.

This command checks the Jenkins service status.

11. Accessing Jenkins

- http://localhost:8080: The default URL for accessing Jenkins.

You can access Jenkins by navigating to this URL in your web browser.

*12. sudo cat /var/lib/jenkins/secrets/initialAdminPassword*

- cat: Displays the contents of a file.
- /var/lib/jenkins/secrets/initialAdminPassword: The file containing the initial admin password.

This command displays the initial admin password required for the Jenkins setup wizard.

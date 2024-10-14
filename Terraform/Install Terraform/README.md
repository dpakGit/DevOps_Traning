# **How to Install Terraform on Linux**

## Install Terraform on Linux Using Zip Archive
Follow the steps below to install Terraform on a Linux system using the downloaded zip file. The instructions apply to all Linux distributions.

1. Browse to the Download Terraform page.

2. Select the Linux tab under the Operating System heading. The latest version is preselected.

3. Scroll down and right-click the Download button for your system's architecture. In our case, it is AMD64.
   ![image](https://github.com/user-attachments/assets/b9500baf-16f2-48e3-bafd-24cee6a48118)


4. Use the wget tool and the link you previously copied to download the file:
`````````````````````````
wget https://releases.hashicorp.com/terraform/1.9.2/terraform_1.9.2_linux_amd64.zip
``````````````````````````````````
Note: Always download the latest version of terraform.

5. Run the command below to find a user directory in $PATH to put the Terraform binary in it:
``````````````
echo $PATH
``````````````````````````````
We will place the Terraform executable file in /usr/bin

6. Unzip the file to the directory you chose in the previous step. Use the full file name with the extension when extracting the archive. Make sure to use the correct name for your architecture and the version you downloaded. For example, for version 1.9.2, run:
`````````````````````````````````````````````````````````````````
sudo unzip terraform_1.9.2_linux_amd64.zip -d /usr/bin
``````````````````````````````````````````````````````````````````

The above command will also move the unziped file to the desired location

The output shows the path where the extracted Terraform file is located.

7. To verify if the Terraform directory is in the selected location, use the ls command. For example:


`````````````````````````
ls -l /usr/bin
``````````````````````````

8. Verify the installation by running a terraform command. For example, check the version with:


```
terraform -version
```

The output shows the Terraform version you installed.


## Day 10: Linux Bash Scripts

### Task:
### The production support team of xFusionCorp Industries is working on developing some bash scripts to automate different day to day tasks. One is to create a bash script for taking websites backup. They have a static website running on App Server 3 in Stratos Datacenter, and they need to create a bash script named blog_backup.sh which should accomplish the following tasks. (Also remember to place the script under /scripts directory on App Server 3).
### a. Create a zip archive named xfusioncorp_blog.zip of /var/www/html/blog directory.
------------------------------------------------

### Break down of the task and explanation of each step in detail.

The task is indeed about writing a bash script that converts the files and folders in the blog directory into a zip file named xfusioncorp_blog.zip. Here's a breakdown of the task and a step-by-step explanation:

Task: Create a bash script named blog_backup.sh that creates a zip archive of the /var/www/html/blog directory.

What the script needs to do:

1. Take the files and folders in the /var/www/html/blog directory and compress them into a single zip file.

2. Name the zip file xfusioncorp_blog.zip.

This script will create a zip file named xfusioncorp_blog.zip in the current working directory (which is /scripts in this case). If you want to specify a different location for the zip file, you can modify the script accordingly.

That's it! With this script, you'll be able to create a zip archive of the blog directory and its contents.
---------------------------------------------------

**What I did**
```
ssh steve@172.16.238.11
[steve@stapp02 ~]$ 

ls /scripts/ # Scripts directory exists

ls -alh /scripts/

# Step 1: Create a new file for the script

sudo vi /scripts/blog_backup.sh
---
#!/bin/bash
zip -r /scripts/xfusioncorp_blog.zip /var/www/html/blog
---

ls /scripts/

sudo chmod +x /scripts/blog_backup.sh

sudo /scripts/blog_backup.sh
ls /scripts/
```

--------------------------------------
**MetaAI Solution**

----------------------------------------------------------
Let's break down the task and explain each step in detail.

Task: Create a bash script named blog_backup.sh that creates a zip archive named xfusioncorp_blog.zip of the /var/www/html/blog directory.

- Step 1: Create a new file for the script

To create a new file for the script, you can use a text editor like nano or vim. Since the script needs to be placed under the /scripts directory on App Server 3, you'll need to log in to App Server 3 and navigate to the /scripts directory.


```
sudo vi /scripts/blog_backup.sh
```

This command will open a new file named blog_backup.sh in the vi editor. If the file doesn't exist, it will be created.

- Step 2: Add the shebang line

The first line of the script should be the shebang line, which specifies the interpreter that should be used to run the script. In this case, we're using bash, so the shebang line would be:


```
#!/bin/bash
```

This line tells the system that this script should be run using the bash shell.

- Step 3: Create the zip archive

To create the zip archive, you can use the zip command. The basic syntax of the zip command is:


```
zip [options] output_file input_file
```

In this case, we want to create a zip archive named xfusioncorp_blog.zip of the /var/www/html/blog directory. We'll use the -r option to tell zip to recurse into directories, so it will include all files and subdirectories in the archive.


```
zip -r /scripts/xfusioncorp_blog.zip /var/www/html/blog
```
/scripts/xfusioncorp_blog.zip is the path and name of the zip archive that will be created.

/var/www/html/blog is the directory that will be archived.


However, it's generally a good idea to specify the output file in the same directory as the script or in a designated backup directory.

**Note:**

- If you're running the zip command from within the /scripts directory, you can use the following command:


```
zip -r xfusioncorp_blog.zip /var/www/html/blog
```

This will create the xfusioncorp_blog.zip file in the current working directory, which is /scripts.

- However, if you're running the zip command from a different directory, you'll need to specify the full path to        the output file, like this:


```
zip -r /scripts/xfusioncorp_blog.zip /var/www/html/blog
```

This will create the xfusioncorp_blog.zip file in the /scripts directory, regardless of your current working directory.

So, the difference between the two commands is the path to the output file:

- If you specify a relative path (just the filename xfusioncorp_blog.zip), the file will be created in the current working directory.
- If you specify an absolute path (/scripts/xfusioncorp_blog.zip), the file will be created in the specified directory, regardless of your current working directory.

In the context of the script, if you want the zip file to be created in the /scripts directory, you can use either approach, depending on how you plan to run the script. If the script is designed to be run from within the /scripts directory, the first approach is fine. But if the script might be run from anywhere, it's better to specify the full path to the output file.


Step 4: Save and close the file

Once you've added the script, save and close the file using Ctrl+O to save and Ctrl+X to exit.

Step 5: Make the script executable

To make the script executable, you need to change its permissions using the chmod command:


bash
sudo chmod +x /scripts/blog_backup.sh


This command adds execute permissions to the script, allowing you to run it like a command.

Step 6: Run the script

To run the script, simply execute the following command:


bash
sudo /scripts/blog_backup.sh


This will create a zip archive named xfusioncorp_blog.zip in the /scripts directory.

Step 7: Verify
ls /scripts/



- Putting it all together:

To create the script and place it under the /scripts directory on App Server 3, follow these steps:

1. Log in to App Server 3.

2. Create a new file named blog_backup.sh under the /scripts directory using a text editor, such as sudo nano /scripts/blog_backup.sh.

3. Copy and paste the script into the file.

4. Save and close the file.

5. Make the script executable by running the command sudo chmod +x /scripts/blog_backup.sh.

You can then run the script by executing the command sudo /scripts/blog_backup.sh.

Here's the complete script:


bash
#!/bin/bash

# Create a zip archive of /var/www/html/blog directory
cd /scripts
zip -r xfusioncorp_blog.zip /var/www/html/blog


Make sure to save the script in the /scripts directory and make it executable using chmod. You can then run the script to create the zip archive.

Tips and Variations

- You can add error handling to the script to check if the zip command was successful.
- You can also add logging to the script to log the output of the zip command.
- If you want to create the zip file in a different directory, you can specify the full path in the zip command.
- You can also use other compression tools like tar or gzip to create archives.

---------------------------------------------------

**Note:**

In this case, xfusioncorp_blog.zip is the zip file that contains the compressed version of the files and subdirectories in the /var/www/html/blog directory.

Think of it like this:

- /var/www/html/blog is the original directory containing files and subdirectories.
- xfusioncorp_blog.zip is the compressed archive that contains a copy of the files and subdirectories from the /var/www/html/blog directory.

When you extract the xfusioncorp_blog.zip file, you'll get the same directory structure and files as the original /var/www/html/blog directory.

So, xfusioncorp_blog.zip is essentially a backup or archive of the /var/www/html/blog directory, compressed into a single file for easier storage or transfer.

-------------------------------
**Note:**

When you zip the /var/www/html/blog directory, the resulting zip file will contain all the files and subdirectories within the blog directory, as well as the directory structure itself.

However, the zip file will not include any files or directories outside of the /var/www/html/blog directory. In other words, it will not include:

- Any files or directories in /var that are not inside /var/www/html/blog
- Any files or directories in /var/www that are not inside /var/www/html/blog
- Any files or directories in /var/www/html that are not inside /var/www/html/blog

The zip file will only include the contents of the /var/www/html/blog directory and its subdirectories.

For example, if the directory structure is like this:


/var
  /www
    /html
      /blog
        /images
          image1.jpg
          image2.jpg
        index.html
        style.css
      /other
        other.html


The zip file xfusioncorp_blog.zip will contain:


/blog
  /images
    image1.jpg
    image2.jpg
  index.html
  style.css


It will not include the /other directory or its contents, because it's not inside the /var/www/html/blog directory.

So, to answer your question, when you zip the /var/www/html/blog directory, it will include all files and subdirectories within the blog directory, but not any files or directories outside of it in the /var, /www, or /html directories that are not part of the blog directory.

-----------------------------------------
**Note:**


When you zip the /var/www/html/blog directory, it will only include the contents of the blog directory and its subdirectories. It will not include any other directories or files outside of the blog directory, including the /var/www directory's sibling directories like /var/xyz.

The resulting zip file will contain the directory structure starting from the blog directory, like this:


/blog
  /images
    image1.jpg
    image2.jpg
  index.html
  style.css


The /var and /www and /html directories will not be included in the zip file as part of the directory structure. Only the contents of the blog directory and its subdirectories will be included.

So, in your example:


/var
  /www
    /html
      /blog
        /images
          image1.jpg
          image2.jpg
        index.html
        style.css
  /xyz
    xyz.txt


The /xyz directory and its contents will not be included in the zip file, because it's not part of the /var/www/html/blog directory. Only the contents of the blog directory will be included in the zip file.

The directory structure of the zip file will be:


/blog
  /images
    image1.jpg
    image2.jpg
  index.html
  style.css


Not:


/var
  /www
    /html
      /blog
        /images
          image1.jpg
          image2.jpg
        index.html
        style.css


The zip file will only contain the blog directory and its contents, not the entire directory structure from /var to /blog.

--------------------------------------

**Note:**

/var/www/html/ is the path that leads to the blog directory. When you zip the /var/www/html/blog directory, you're essentially zipping the contents of the blog directory, and the /var/www/html/ part is just the path that specifies where the blog directory is located.

Think of it like an address:

/var/www/html/ is the street address (the path to the directory)
blog is the house (the directory itself)

When you zip the /var/www/html/blog directory, you're zipping the contents of the "house" (the blog directory), not the entire street address (the /var/www/html/ path).

So, in this case, /var/www/html/ is just the path that helps you locate the blog directory, and the zip file will only contain the contents of the blog directory, not the entire directory structure from /var to /html.

-------------------------------------


Practice Date : 14.3.2025

## Adding a new SSH key to your GitHub account

Reference links:

1: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account

**Steps:**
1. **Generate the ssh key** - Type the command "ssh-keygen" on your local machine.

   we wil get a output something like the following

```
Generating public/private ed25519 key pair.
Enter file in which to save the key (/home/ubuntu/.ssh/id_ed25519): 
/home/ubuntu/.ssh/id_ed25519 already exists.
Overwrite (y/n)? y
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/ubuntu/.ssh/id_ed25519
Your public key has been saved in /home/ubuntu/.ssh/id_ed25519.pub   # copy from here
The key fingerprint is:
SHA256:ffRUUCmOZCbnN3H5TfaMfxD4Ze/6ef9Ut7kNKiwR10Q ubuntu@ip-172-31-86-107
The key's randomart image is:
```

2.copy the line "/home/ubuntu/.ssh/id_ed25519.pub"

3. To get the public key type the commnad - "cat /home/ubuntu/.ssh/id_ed25519.pub"
   the output is the public key

4.Copy the public key 
5. 

# Provider Authentication and Configuration

 Note : Here the provider is AWS Cloud service
 
 ## Step-1    Steps for creating an User

-> Login to the AWS console

-> Search for IAM
  
### **IAM** 
-> User -> Create user

### **Specify user details** 
-> User name -> Provide user access to the AWS Management Console

### **Set permissions**
-> Permissions options -> Attach policies directly

-> Permissions policies -> AmazonEC2FullAccess

-> create user

-> Return to users list


## Step-2 Steps to Create Access Keys and Secret Access key

-> Click on the user name
 
 ### **User-Name**       
-> Security Credentials -> Access keys -> Create access keys 

### **Access key best practices & alternatives**
-> Command Line Interface (CLI) 

### Retrieve access keys 

#### ***Access key***

 Access key                                
       
 ```                                  
 my_access_key_id                    
 ```                                 

 Secret access key
 ```
 my_secret_access_key
 ```



 




## Step-3    Now export the AWS Keys into Env. Variables


In the CLI run the following commands :

Copy and paste the Access key Id and Secret Access key in the respective commands


```
1. echo "export AWS_ACCESS_KEY_ID="my_access_key_id" " >> ~/.bashrc
```

```
2. echo "export AWS_SECRET_ACCESS_KEY=" my_secret_access_key" " >>  ~/.bashrc
```

```
source ~/.bashrc
```

Run the following commnad to verify AWS credentials are set.

```
set | grep -i AWS
```

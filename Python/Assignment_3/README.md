# Login Authentication Program

```
# Prompt user for username and password

username = input("Enter your username: ")
password = input("Enter your password: ")

# Check username and password

if username == "admin":
    if password == "password":
        print("Login successful! Welcome Admin.")
    else:
        print("Wrong password. Try again.")
else:
    print("Incorrect username.")
```

Code Explanation:

This code is a simple login authentication program. Here's how it works:

- The program prompts the user to enter their username and password using the input() function.

- The entered username and password are stored in the username and password variables, respectively.

- The program checks if the entered username is "admin". If it is, the program proceeds to check the password.

- If the username is "admin", the program checks if the entered password is "password". If it is, the program prints a 
  success message.

- If the password is incorrect, the program prints an error message.

- If the username is not "admin", the program prints an error message indicating that the username is incorrect.



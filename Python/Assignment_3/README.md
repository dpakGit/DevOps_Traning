# Login Authentication Program

Ex: 1

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

Ex: 2

```
# Prompt user for username and password

username = input("Enter your username: ")
password = input("Enter your password: ")

## Authentication Logic

if username == "admin":

    # Check admin password
    if password == "password":
        print("Login successful! Welcome, admin.")
    elif password == "12345":
        print("Weak password. Please reset your password.")
    else:
        print("Incorrect password. Please try again.")

elif username == "guest":

    # Check guest password
    if password == "guest":
        print("Login successful! Welcome, guest.")
    else:
        print("Incorrect password. Please try again.")

else:
    print("Unknown user. Please try again.")
```

Code Explanation:

This code is a simple login authentication program with multiple user accounts. Here's how it works:

User Input
1. The program prompts the user to enter their username and password using the input() function.

2. The entered username and password are stored in the username and password variables, respectively.

Authentication Logic:

1. The program checks if the entered username is "admin".
        - If it is, the program checks the password.
        - If the password is "password", the program prints a success message.
        - If the password is "12345", the program prints a weak password message.
        - For any other password, the program prints an incorrect password message.

2. If the username is not "admin", the program checks if it is "guest".
        - If it is, the program checks the password.
        - If the password is "guest", the program prints a success message.
        - For any other password, the program prints an incorrect password message.

3. If the username is neither "admin" nor "guest", the program prints an unknown user message.

Code Structure:

The code uses nested if-elif-else statements to implement the authentication logic. This structure allows the program to check multiple conditions and handle different scenarios accordingly.

Example Use Cases:

- Valid admin login: Enter "admin" as the username and "password" as the password.
- Weak admin password: Enter "admin" as the username and "12345" as the password.
- Valid guest login: Enter "guest" as the username and "guest" as the password.
- Unknown user: Enter any username other than "admin" or "guest".


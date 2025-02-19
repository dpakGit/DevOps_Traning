
### Assignment-1 : Leap Year Determination Program

Alternatively, you could also use the following names:

1. Determine if a Year is a Leap Year, or

2. Leap Year Checker Program.

Q. What to determine whether a year is a leap year or not ?

Ans: 
A year is a leap year if it's divisible by 4, except for years divisible by 100, which must also be divisible by 400 to be leap years. For example, 1700, 1800, and 1900 are not leap years, while 1600 and 2000 are.
To determine if a year is a leap year, follow these rules:

Examples:

- Years 1700, 1800, and 1900 are not leap years.
- Years 1600 and 2000 are leap years."


**Code Explanation**

Let's break down the two codes:

Code 1: Nested Conditional Statements


```
year = int(input("Enter the Year: "))

if year % 4 == 0: # Condition-1 if statement
    
    if year % 100 == 0: # Condition-2 if statement
        
        if year % 400 == 0: # Condition-3 if statement
            print(f"{year} is a Century year and a leap year.")
        else: # Condition-3 else statement                              
            print(f"{year} is neither a Century year or not a leap year.")
    
    else: # Condition-2 else statement
        print(f"{year} is a leap year.")

else: # Condition-1 else statement
    print(f"{year} is not a leap year.")
```

Explanation:
This code uses nested conditional statements to determine whether a given year is a leap year or not.

Here's how it works:

1. First Condition: if year % 4 == 0: checks if the year is evenly divisible by 4. If this condition is true, the code proceeds to the next condition.

2. Second Condition: if year % 100 == 0: checks if the year is a century year (i.e., evenly divisible by 100). If this condition is true, the code proceeds to the next condition.

3. Third Condition: if year % 400 == 0: checks if the year is evenly divisible by 400. If this condition is true, the code prints that the year is a leap year.

4. Else Clauses: If any of the above conditions are false, the code prints that the year is not a leap year.

Leap Year Rules:

The code implements the following leap year rules:

- The year must be evenly divisible by 4.
- If the year is a century year (i.e., evenly divisible by 100), it must also be evenly divisible by 400.

Q. Explain the following line in the code - if year % 100 == 0:

Sol:
This line of code is checking if the year is a century year (i.e., a year that is divisible by 100).

Here's a breakdown:

- year % 100: This is using the modulo operator (%) to find the remainder of the year when divided by 100.
- == 0: This is checking if the remainder is equal to 0.

In other words, this line is asking: "Is the year exactly divisible by 100?"

If the answer is yes, then the year is a century year (e.g., 1900, 2000, 2100, etc.).

This check is important in the leap year calculation because century years have a special rule:

- Century years are only leap years if they are also divisible by 400.

So, if the year is a century year, the code needs to perform an additional check to see if it's also divisible by 400.


Code 2: Simplified Conditional Statement

```
year = int(input("Enter the Year: "))

if year % 4 == 0 and (year % 100 != 0 or year % 400 == 0):
    print(f"{year} is a leap year.")
else:
    print(f"{year} is not a leap year.")


# Or use the following if-statement in place of the above if-statement in this code:

# if (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0):

```

Explanation:

This code uses a simplified conditional statement to determine whether a given year is a leap year or not.

Here's how it works:

1. Single Condition: if year % 4 == 0 and (year % 100 != 0 or year % 400 == 0): checks two conditions simultaneously:
 - year % 4 == 0 checks if the year is evenly divisible by 4.
 - (year % 100 != 0 or year % 400 == 0) checks two sub-conditions:
 - year % 100 != 0 checks if the year is not a century year (i.e., not evenly divisible by 100).
 - year % 400 == 0 checks if the year is evenly divisible by 400.

2. Leap Year Rule: If the year meets both conditions, it is considered a leap year.

This simplified code achieves the same result as the nested conditional statement code, but with fewer lines of code and improved readability.

That's a common misconception.

Not all years that are divisible by 4 are leap years. There's an exception for century years.

According to the Gregorian calendar rules:

- Years that are divisible by 4 are leap years, unless...
- The year is also divisible by 100, in which case it's not a leap year, unless...
- The year is also divisible by 400, in which case it is a leap year.

So, if we don't check for century years, we'll incorrectly identify years like 1900, 2100, etc. as leap years.

For example:

- 1900 is divisible by 4, but it's not a leap year because it's a century year that's not divisible by 400.
- 2000 is divisible by 4 and 400, so it is a leap year.

To accurately determine leap years, we need to check all three conditions:

1. Year is divisible by 4.
2. Year is not a century year (or is divisible by 400).

By checking these conditions, we can correctly identify leap years.




### Assignment-2 : Login Authentication Program

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

More Examples : - https://sparkbyexamples.com/python/python-nested-if-else/

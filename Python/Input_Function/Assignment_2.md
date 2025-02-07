#### Assignment Brief

**"Python Program: User Data Collector**

This program is designed to collect and store user data, including name, age, height, and student status.
The collected information is stored in a dictionary, allowing for easy retrieval and management of user data.

```
user_data = {}     # Initializing Dictonary

# Input from user

user_data['name'] = input("Enter your Name:- ")

user_data['age'] = int(input("Enter your age:- "))

user_data['height'] = float(input("Enter your height:- "))

user_data['student_status'] = input("Are you a student (yes/no):- ")

# Print the input from the user

print(user_data)
```

Explanation of the above program

Let's break down the above Python program:

**Program Overview**
This program collects user data (name, age, height, and student status) and stores it in a dictionary called user_data. Finally, it prints the collected data.

**Step-by-Step Explanation**

1. **Initialize an empty dictionary:** user_data = {}

This line creates an empty dictionary called user_data to store the user's information.

2. **Collect user data:**
    - user_data['name'] = input("Enter your name: ")

This line prompts the user to enter their name and stores the input as a string in the user_data dictionary under the key 'name'.

    - user_data['age'] = int(input("Enter your age: "))

This line prompts the user to enter their age and stores the input as an integer in the user_data dictionary under the key 'age'. The int() function converts the user's input into an integer.

    - user_data['height'] = float(input("Enter your height: "))

This line prompts the user to enter their height and stores the input as a floating-point number in the user_data dictionary under the key 'height'. The float() function converts the user's input into a floating-point number.

    - user_data['student'] = input("Are you a student (yes/no)")

This line prompts the user to enter their student status (yes/no) and stores the input as a string in the user_data dictionary under the key 'student'.

3. **Print the collected data:** print(user_data)

This line prints the entire user_data dictionary, displaying all the collected user information.

**Example Output**

If the user enters the following data:

- Name: John Doe
- Age: 25
- Height: 175.5
- Student status: yes

The program will output:

**{'name': 'John Doe', 'age': 25, 'height': 175.5, 'student': 'yes'}**


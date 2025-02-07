## Assignment Brief

**"Create a Python program that takes input for a student's name and their marks in three subjects, calculates the total percentage score, and outputs the student's name along with their total percentage score."**

```
# My code

Name = input("Student Name : - ")
sub1 = input("Marks secured in sub-1: = ")
sub2 = input("Marks secured in sub-2: = ")
sub3 = input("Marks secured in sub-3: = ")
Total_Marks = 300
Total = int(sub1) + int(sub2) + int(sub3)
percentage = (Total/Total_Marks) * 100
# print(f"Name of the student is {Name} and Percentage of marks secured by him/her is {percentage} %")

print(f"Name of the student is {Name} \nPercentage of marks secured by him/her is {percentage} %")

```


```
# Met Code -0 second method

# Take input for student's name
name = input("Enter student's name: ")

# Take input for marks in three subjects
subject1_marks = float(input("Enter marks in Subject 1: "))
subject2_marks = float(input("Enter marks in Subject 2: "))
subject3_marks = float(input("Enter marks in Subject 3: "))

# Calculate total marks
total_marks = subject1_marks + subject2_marks + subject3_marks

# Calculate total percentage score
total_percentage = (total_marks / 300) * 100

# Output student's name and total percentage score
print(f"Student Name: {name}")
print(f"Total Percentage Score: {total_percentage:.2f}%")
```

Here's how the above program works(second method):

1. The program takes input for the student's name using the input() function.

2. It then takes input for the marks in three subjects, converting the input to floating-point numbers using float().

3. The program calculates the total marks by adding the marks in all three subjects.

4. It calculates the total percentage score by dividing the total marks by the maximum possible marks (300) and multiplying by 100.

5. Finally, the program outputs the student's name and total percentage score using f-strings.

   The **:.2f format specifier** rounds the percentage score to two decimal places.

 **Q. Explain the python command - # subject1_marks = float(input("Enter marks in Subject 1: "))**

MET :

Let's break down the Python command:

subject1_marks = float(input("Enter marks in Subject 1: "))

Here's what each part does:

1. subject1_marks: This is the variable name that will store the user's input. It's a descriptive name indicating that it holds the marks for Subject 1.

2. float(): This is a built-in Python function that converts a string or integer into a floating-point number. It's used here to allow the user to enter decimal marks (e.g., 85.5).

3. input(): This is a built-in Python function that takes user input from the console. It displays the prompt message inside the parentheses and waits for the user to enter a value.

4. "Enter marks in Subject 1: ": This is the prompt message displayed to the user. It tells them what to enter.

So, when you run this command:

- The program displays the prompt "Enter marks in Subject 1: ".
- The user enters a value (e.g., 90 or 85.5).
- The input() function captures the user's input as a string.
- The float() function converts the input string into a floating-point number.
- The result is stored in the subject1_marks variable.

This allows the program to accept and process decimal marks for Subject 1.

**Correct Syntax:**

Q. Is the following syntax correct ?

```
subject1_marks = input(float("Enter marks in Subject 1: "))  # Incorrect Syntax
```
The above syntax is incorrect,Following is the correct syntax:

```
subject1_marks = float(input("Enter marks in Subject 1: "))
```

**The reason is that the input() function returns a string, and we need to convert that string to a float using the float() function.**

In your suggested syntax:

subject1_marks = input(float("Enter marks in Subject 1: "))

You are trying to pass a float value to the input() function, which is incorrect. The input() function expects a string prompt as its argument, not a float value.

Additionally, passing a float value to the input() function will still result in a string output, since the input() function treats all user input as strings by default.

Additionally, the float() function is being used incorrectly. It's trying to convert the string prompt to a float, which will raise a ValueError because the prompt is not a valid float value.

So, stick with the original syntax:

subject1_marks = float(input("Enter marks in Subject 1: "))




# Python program for simple calculator

My Calculator Code  

Code < Version Number> - Updates or changes

**Code Version 1 - Initial Version**

```
def add (n,m):
    return m + n 

def sub (m,n):
    return m + n

a = float(input("Enter the first number : "))

b = float(input("Enter the second number : "))


if operation == 1:
    add(a,b)
    print("the sum of two numbers is : ", add(a,b))

elif operation == 2:
    sub(a,b)
    print("the subtraction of two numbers is : ", add(a,b))

else :
    print("Invalid Numbers")
```

 **Code Version 2 -**

 Error  if operation ==1:

 NameError: name 'operation' is not defined. Did you mean: 'StopIteration'?

  Added the line : operation = input(" Emter 1 for add 2 for sub")

```
def add (n,m):
    return m + n 

def sub (m,n):
    return m - n

a = float(input("Enter the first number : "))

b = float(input("Enter the second number : "))

operation = input(" Emter 1 for add 2 for sub")

if operation == 1:
    add(a,b)
    print("the sum of two numbers is : ", add(a,b))

elif operation == 2:
    sub(a,b)
    print("the subtraction of two numbers is : ", add(a,b))

else :
    print("Invalid Numbers")
```


**Code Version 3 -** 

Error :   a = float(input("Enter the first number : "))
ValueError: could not convert string to float: '& C:/Users/dpakm/AppData/Local/Programs/Python/Python313/python.exe c:/Users/dpakm/OneDrive/Desktop/Python/Variables/file1.py'
the value 1 in the following line "if operation ==1:" to "1"

changed the number type to string from int as the output of the following line is a string by default "operation = input(" Emter 1 for add 2 for sub")"
 and without type conversion it was treating it as a number.


```
def add (n,m):
    return m + n 

def sub (m,n):
    return m - n

a = float(input("Enter the first number : "))

b = float(input("Enter the second number : "))

operation = input(" Emter 1 for add 2 for sub")

if operation =="1":
    add(a,b)
    print("the sum of two numbers is : ", add(a,b))

elif operation =="2":
    sub(a,b)
    print("the subtraction of two numbers is : ", add(a,b))

else :
    print("Invalid Numbers")
```

 **Code Version 4 - Updated with changes - Final Code**

 Added two new functions multiplication and division

```
# Arithmetic Operations Functions

# Addition function
def add (num1,num2):
    return num1 + num2 

# Subtraction Function
def sub (num1,num2):
    return num1 - num2

# Multiplication Function
def multiply (num1,num2):
    return num1 * num2 

# Division Function
def division(num1,num2):
    return num1/num2

# Average Function
def avg(num1,num2):
    return (num1 + num2)/2


# Main Program

# Take input from the user

Number_1 = float(input("Enter the first number : "))

Number_2 = float(input("Enter the second number : "))

print("Please select the required operation to perform : \n " \
                  "Enter 1 for Addition ! \n " \
                  "Enter 2 for Subtraction ! \n " \
                  "Enter 3 for multiplication ! \n " \
                  "Enter 4 for Division ! \n " \
                  "Enter 5 for Average !")

# Get user's mathematical operation choice:
operation = int(input(" Type 1,2,3,4, or 5 : "))


# Perform chosen operation
if operation == 1:
    add(Number_1,Number_2)
    print("The sum of two numbers", Number_1, "and", Number_2,"is :", add(Number_1,Number_2))
    print(Number_1, "+", Number_2, "=" , add(Number_1,Number_2))
 
elif operation == 2:
    sub(Number_1,Number_2)
    print("The subtraction of two numbers", Number_1, "and", Number_2, "is : ", sub(Number_1,Number_2))
    print(Number_1, "+", Number_2, "=" , sub(Number_1,Number_2)) 

elif operation == 3:
    multiply(Number_1,Number_2)
    print("The multiplication of two numbers", Number_1, "and", Number_2, "is : ", multiply(Number_1,Number_2))

elif operation == 4:
    division(Number_1,Number_2)
    print("The division of two numbers is", Number_1, "and", Number_2, "is : ", division(Number_1,Number_2))

elif operation == 5:
    division(Number_1,Number_2)
    print("The average of two numbers is", Number_1, "and", Number_2, "is : ", avg(Number_1,Number_2))

else :
    print("Invalid Input for Operation: Please try again !")
```


**Code taken from ..**

```
# geek/w3s/tutorialpoint/...

# Function to add two numbers
def add(num1, num2):
    return num1 + num2

# Function to subtract two numbers
def subtract(num1, num2):
    return num1 - num2

# Function to multiply two numbers
def multiply(num1, num2):
    return num1 * num2

# Function to divide two numbers
def divide(num1, num2):
    return num1 / num2

print("Please select operation -\n" \
        "1. Add\n" \
        "2. Subtract\n" \
        "3. Multiply\n" \
        "4. Divide\n")


# Take input from the user
select = int(input("Select operations form 1, 2, 3, 4 :"))

number_1 = int(input("Enter first number: "))
number_2 = int(input("Enter second number: "))

if select == 1:
    print(number_1, "+", number_2, "=",
                    add(number_1, number_2))

elif select == 2:
    print(number_1, "-", number_2, "=",
                    subtract(number_1, number_2))

elif select == 3:
    print(number_1, "*", number_2, "=",
                    multiply(number_1, number_2))

elif select == 4:
    print(number_1, "/", number_2, "=",
                    divide(number_1, number_2))
else:
    print("Invalid input")
```


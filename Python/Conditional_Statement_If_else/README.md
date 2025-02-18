**Date 14.2.2025**

https://www.w3schools.com/python/python_conditions.asp#gsc.tab=0

https://www.geeksforgeeks.org/conditional-statements-in-python/?ref=lbp

https://www.tutorialspoint.com/python/python_if_else.htm


**Note:** "The else block is used to execute an alternative block of code when the conditions in an if or elif statement are not met or the condition(s) associated with an if or elif statement evaluates to False.
It provides a way to handle all other cases that are not covered by the if or elif conditions."

```
# Ex:1 # When condition is true
a=108
b=75
if a>b:
    print("a is greater than b") # When condition is true
else:
    print("a is smaller than b") # When if_condition is false
```

```
# Ex:2 # When if_condition is false

a=75
b=108
if a>b:
    print("a is greater than b") # When condition is true
else:
    print("a is smaller than b") # When if_condition is false
```

```
# Ex:3
age =15
if age >=18:
    print("Age:",age)
    print("You are eligible for voting")
else:
     print("Age:",age)
     print("You are not eligible for voting")
```

```
# EX:4
age =int(input("Enter Your Age: "))
if age >=18:
    print(age >=18)
    print("Age:",age)
    print("You are eligible for voting")
else:
     print("Age:",age)
     print("You are not eligible for voting")
```

```
Ex: 5
temp = float(input("Enter the Temperature:"))
if temp < 25:
    print("It's a cool day")
else:
    print("It's a hot day")
```

```
Ex:6
age =int(input("Enter Your Age: "))

if age <= 12:
    print("Travel for free.")
else:
    print("Pay for ticket.")
```

**Short Hand if-else**

Practice all examples in the following link:

https://www.w3schools.com/python/python_conditions.asp#gsc.tab=0

The short-hand if-else statement allows you to write a single-line if-else statement.

```
Ex:

marks = 45
res = "Pass" if marks >= 40 else "Fail"

print(f"Result: {res}")
```

```
Ex:

marks =int(input("Enter Your marks: "))
res = "Pass" if marks >= 40 else "Fail"

print(f"Result: {res}")
```

```
EX:

value = None
if value:
    print("Value is true")
else:
    print("Value is False")
```

Explanation of the above code:

This code is using a conditional statement to evaluate the value of the variable value. Here's a breakdown:

Code Explanation:

```
value = None  # Initialize value as None

if value:  # Check if value is truthy
    print("Value is true")  # If truthy, print this message
else:  # If value is falsy
    print("Value is False")  # Print this message
```

**Truthy and Falsy Values**

- In Python, the following values are considered falsy:

```
- None
- False
- 0 (integer)
- 0.0 (float)
- "" (empty string)
- [] (empty list)
- {} (empty dictionary)
- () (empty tuple)
```

**All other values are considered truthy.**

Code Execution of the above code:

Given that value is initialized as None, which is a falsy value, the code will execute the else block and print:


Value is False



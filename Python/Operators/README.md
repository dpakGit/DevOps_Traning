# Python Operators

https://www.geeksforgeeks.org/python-operators/

https://www.w3schools.com/python/python_operators.asp




Ritesh Mishra Git Link :
https://github.com/rishabhnmishra/python_tutorial_notes/blob/main/Chap-8%20Operators/Python%20Notes%20by%20Rishabh%20Mishra%20Chap-08-Operators.pdf

#### Explain Python Identity Operators:

Source: Meta Ai

Python Identity Operators are used to compare the identities of objects, not their values. There are two Identity Operators in Python:

1. is: Returns True if both variables refer to the same object in memory.
2. is not: Returns True if both variables do not refer to the same object in memory.

Here's an example:
```
a = [1, 2, 3]
b = [1, 2, 3]
c = a
print(a is b)  # Output: False (different objects in memory)
print(a is c)  # Output: True (same object in memory)
print(a is not b)  # Output: True (different objects in memory)
print(a is not c)  # Output: False (same object in memory)
```

In this example:
- a and b are two separate lists with the same values, but they are not the same object in memory. Therefore, a is b returns False.
- c is assigned the same object as a, so a is c returns True.

Identity Operators are useful when you want to check if two variables refer to the same object in memory, rather than just having the same value.

#### Benefits of Double Division Operator over Single Division Operator in Python

https://www.geeksforgeeks.org/benefits-of-double-division-operator-over-single-division-operator-in-python/

**Operators Example**
```
a = 2
p = (2, 4, 6)

print(a==p) # Output - False
print(p[0]) # Output - 2


print(0==False) # Output - True

print(1==True)  # Output - True 
```

The print() function in Python can evaluate expressions, including mathematical operations, and print the result.

In the example print(a == p), the == operator is a comparison operator, not a mathematical operation in the classical sense. However, it does evaluate to a boolean value (True or False) which is then printed.

You can perform various mathematical operations inside the print() function, such as:

 - Arithmetic operations: print(2 + 3), print(4 * 5), etc.
 - Comparison operations: print(2 > 3), print(4 == 4), etc.
 - Logical operations: print(True and False), print(True or False), etc.
 - Bitwise operations: print(5 & 3), print(5 | 3), etc.

 Here are some examples:
 ```
print(2 + 3)  # Output: 5
print(4 * 5)  # Output: 20
print(2 > 3)  # Output: False
print(4 == 4)  # Output: True
print(True and False)  # Output: False
print(5 & 3)  # Output: 1
```
So, to answer your question, yes, you can perform various operations inside the print() function, and it will print the result of those operations.


# Arithmetic Operators:
```
# variables
a=5
b=2

print("Addition:", a + b) # Addition

print("Subtraction:", a - b) # Subtraction

print("Multiplication:", a * b) # Multiplication

print("Division:",a / b)  # Division, Output : This will provide quotiend of the division
print(type(a/b)) # This will show the type of the output
```

**Floor Division**

Floor division (//) returns the largest whole number that is less than or equal to the result of the division

In other words, a // b returns the largest whole number that is less than or equal to the result of a divided by b.
```
print("Floor Division:", a // b)
```

**Modulus**

Modulus division returns the remainder of the division of the dividend (a) by the divisor (b). It's also known as the remainder operator.
```
print("Modulus:",a % b)
```

**Exponentiation**
```
print("Exponentiation:",a ** b)
```

# Comparison Operators

```
a = 14

b = 24

print(a==b) # Equal

print(a!=b) # Not Equal

print(a>b) # Greater than

print(a<b) # Smaller than

print(a>=b) # Greater than or equal to

print(a<=b) # Smaller than or equal to
```

# Assignment Operators

```
# Ex:1
a = 5
b = a
print(a)
print(b)
```
```
# Ex:2
a += 3
print(a)
```

```
# Ex : 2.1  Another way of writing Ex:2 
a=10
b=a
print(b)
b+=a
print(b)
```
Expalin the above Code 2.1 - Source  meta

Let's break down the code step by step:

Step 1: Assigning values

a = 10
b = a

Here, we assign the value 10 to variable a. Then, we assign the value of a to variable b. So, both a and b now have the value 10.

Step 2: Printing the initial value of b

print(b)

This line prints the current value of b, which is 10.

Step 3: Incrementing b by a

b += a

Here, we use the augmented assignment operator += to add the value of a to b. Since a is 10, we're effectively adding 10 to b. So, b now becomes 20.

Step 4: Printing the updated value of b

print(b)

This line prints the updated value of b, which is now 20.

So, the output of this code will be:
10
20

```
Ex: 3
a -= 2
print(a)
```

```
Ex:4
a = 6
a *= 3
print(a)
 ```

```
 Ex: 5
a = 6
a /= 3
print(a) # output wiil be a float number
```

```
Ex: 6
a = 5
a //=3
print(a)
```

```
Ex: 7
a = 5
a %=3
print(a)
```

```
Ex:8
a = 4
a **= 2
print(a) 
```




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


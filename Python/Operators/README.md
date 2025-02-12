# Python Operators

https://www.geeksforgeeks.org/python-operators/

https://www.w3schools.com/python/python_operators.asp

See the examples in the below link - V.V.Imp:
https://www.tutorialspoint.com/python/python_operators.htm

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

**Difference between "=" operator and the "==" operator**

Sol: Meta

In Python, the "=" operator and the "==" operator are two distinct operators with different purposes:

Assignment Operator (=)

The "=" operator is used for assignment. It assigns the value on the right-hand side to the variable on the left-hand side.

Example:

x = 5  # Assigns the value 5 to the variable x

In this example, the value 5 is assigned to the variable x.

Equality Operator (==)

The "==" operator is used for comparison. It checks whether the values on both sides are equal.

Example:

x = 5
y = 5
print(x == y)  # Output: True

In this example, the values of x and y are compared, and since they are equal, the output is True.

Key differences:

1. Purpose: "=" is for assignment, while "==" is for comparison.
2. Syntax: "=" has one equals sign, while "==" has two equals signs.
3. Output: "=" does not produce output, while "==" produces a boolean value (True or False).

To illustrate the difference, consider this example:


x = 5  # Assignment
print(x == 5)  # Comparison

In the first line, the value 5 is assigned to x. In the second line, the value of x is compared to 5, and the output is True.

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

**Walrus Operator!**

```
print(x := 3)
```
A nice example of Python's Walrus Operator!

The command print(x := 3) is using the Walrus Operator (:=), which is a feature introduced in Python 3.8.

Here's what's happening:

1. x := 3 is an assignment expression. It assigns the value 3 to the variable x.
2. The Walrus Operator (:=) returns the assigned value, which is 3.
3. The print() function prints the returned value, which is 3.

So, the output of this command will be: 3

After executing this command, the variable x will also be assigned the value 3, and you can use it in subsequent code.

**The Walrus Operator is useful when you want to assign a value to a variable and use that value immediately, like in a loop or a conditional statement.**


Q. Is it that the walrus operator allows us to assign value to a variable inside the print function ?

Sol. 

You've got it!

The Walrus Operator (:=) indeed allows you to assign a value to a variable inside an expression, such as within a print() function.

Before the Walrus Operator, you would have to assign the value to a variable in a separate statement, like this:

x = 3
print(x)

But with the Walrus Operator, you can do it in one line:

print(x := 3)

This is a concise way to assign a value to a variable and use it immediately, all within a single expression.

The Walrus Operator is not limited to print() functions, though. You can use it in other contexts, such as:

- Conditional statements: if (n := len(my_list)) > 5: ...
- Loops: while (line := file.readline()): ...
- List comprehensions: [y for x in my_list if (y := x**2) > 10]

And many more!

Q. print(x :/=2) - is the following a correct syntax of using Walrus Operator , if not give the correct syntax ?

sol.
The syntax print(x :/=2) is not correct.

The correct syntax for the Walrus Operator is :=, not :/=.

If you want to divide x by 2 and assign the result back to x, you can use the augmented assignment operator /= like this:

x /= 2
print(x)

Or, if you want to use the Walrus Operator to assign the result of the division to x and print it in one line, you can do:

print(x := x / 2)

Q. So we cannot do any arithmetic or other operations only assignment is possible through  Walrus Operator ?

Sol.

The Walrus Operator (:=) is specifically designed for assignment, not for performing arithmetic or other operations.

You can only use the Walrus Operator to assign a value to a variable, like this:

x := 5

Or, as we discussed earlier, to assign a value to a variable and use it immediately, like this:

print(x := 5)

You cannot use the Walrus Operator to perform arithmetic operations, like this:

x := 5 + 3  # Incorrect syntax

Instead, you would need to use the assignment operator (=) and perform the arithmetic operation separately, like this:

x = 5 + 3

**However, you can use the Walrus Operator in combination with other operators, like this:**

print(x := 5 * 2)

This would assign the result of the multiplication to x and print it.

More Examples:

print(x := 5 + 2)

print(x := 5 - 2)

print(x := 5 * 2)

print(x := 5 / 2)
... and soon.



# Logical Operators

**"And" operator examples**
```
a = 20
b = 10
 print(a>20 and b<10) # F + F
print(a==20 and b>10) # T + F
print(a>20 and b<20) # F + T
print(a==20 and b==10) # T + T
```

**"OR" operator examples**
```
a = 20
b = 10
print(a==20 or b==10) # T + T
print(a==20 or b>10) # T + F
print(a>20 or b<20) # F + T
print(a>20 or b<10) # F + F
```

**"not" operator examples**


Ex:1
```
a = 20
b = 10
print(not(a==20 and b==10)) # T + T
print(not(a==20 and b>10)) # T + F
print(not(a>20 and b<20)) # F + T
print(not(a>20 and b<10)) # F + F
```

Ex:2
```
a = 20
b = 10
print(not(a==20 or b==10)) # T + T
print(not(a==20 or b>10)) # T + F
print(not(a>20 or b<20)) # F + T
print(not(a>20 or b<10)) # F + F
```

# Identity Operators

https://www.tutorialspoint.com/python/python_identity_operators.htm

https://www.geeksforgeeks.org/python-membership-identity-operators-not-not/

https://www.w3schools.com/python/python_operators.asp

Ex:1
```
a=25
b=25

print(a is b)
print(a is not b)
print("id(a) : ", id(a))
print("id(b) : ", id(b))
```

Ex:2
```
a=[1,2,3]

b=[1,2,3]

print(a is b)
print(a is not b)
print("id(a) : ", id(a))
print("id(b) : ", id(b))
```


Ex:3 Values inside list are same
```
a=[1,2,3]

b=[1,2,3]

a=b

print("Ex:3",a is b)
print("Ex:3",a is not b)
print("id(a) : ", id(a))
print("id(b) : ", id(b))
```

Ex:3.1 Values inside list are different

```
a=[3,4,5,6]

b=[6,7,8,9]

print("Ex:3.1",a is b)
print("Ex:3.1",a is not b)
print("id(a) : ", id(a))
print("id(b) : ", id(b))
```

Ex:3.2
```
a=[3,4,5,6]

b=[6,7,8,9]

a=b

print("Ex:3.2",a is b)
print("Ex:3.2",a is not b)
print("id(a) : ", id(a))
print("id(b) : ", id(b))
```

# V.V.Imporatant
Source: Meta

In Python, when you do a = b, it doesn't exactly assign the same location to b as a. Instead, it makes b point to the same object that a is pointing to.

Here's what happens under the hood:

1. a is assigned a reference to an object (e.g., an integer, string, list, etc.).
2. When you do b = a, b receives a copy of the reference that a has.
3. Both a and b now point to the same object in memory.

However, if you modify the object through a, the changes will be reflected when you access the object through b, because they're pointing to the same object.

But, if you reassign a to a new object, b will still point to the original object.

Here's an example to illustrate this:
```
a = [1, 2, 3]  # a points to a list object
b = a  # b points to the same list object as a

print(id(a))  # prints the memory address of the list object
print(id(b))  # prints the same memory address as above
```

```
a.append(4)  # modifies the list object
print(b)  # prints [1, 2, 3, 4], because b points to the same object
```

```
a = [5, 6, 7]  # reassigns a to a new list object
print(a)  
print(b)  # still prints [1, 2, 3, 4], because b still points to the original object
```
So, to summarize: a = b makes b point to the same object as a, but it doesn't assign the same location to b as a. Instead, it creates a new reference to the same object.

```
# https://www.w3schools.com/python/trypython.asp?filename=demo_oper_identity1

x = ["apple", "banana"]
y = ["apple", "banana"]
z = x

print(x is z)

# returns True because z is the same object as x

print(x is y)

# returns False because x is not the same object as y, even if they have the same content

print(x == y)

# to demonstrate the difference betweeen "is" and "==": this comparison returns True because x is equal to y
```

# Membership Operators

see examples from this below two links:

https://www.tutorialspoint.com/python/python_operators.htm#membership-operators

https://www.geeksforgeeks.org/python-membership-identity-operators-not-not/

Ex:1 **"in" Operator**

```
my_list = ['apple','orange','banana']

print('apple' in my_list)       

print('watermelon' in my_list)
```

Ex:2 **"not in" Operato**r

```
my_list = ['apple','orange','banana']

print('apple' not in my_list)       

print('watermelon' not in my_list)
```

# Bitwise Operators


**How to Convert Decimal to Binary?**

https://www.cuemath.com/numbers/decimal-to-binary/

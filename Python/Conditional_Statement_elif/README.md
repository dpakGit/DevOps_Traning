**Date: 14.2.2025**

https://www.w3schools.com/python/python_conditions.asp#gsc.tab=0

https://www.geeksforgeeks.org/conditional-statements-in-python/?ref=lbp

https://www.tutorialspoint.com/python/python_if_else.htm

```
# EX: 1
a= int(input("Enter first number : "))
b= int(input("Enter second number : "))
c= int(input("Enter third number : "))

if a<b and a<c :
    if b<c:
        print (a,b,c)
    else:
        print(a,c,b)
elif b<a and b<c :
    if a<c:
        print(b,a,c)
    else:
        print(b,c,a)
else :
    # if c<a and c<b:
        if a<b:
            print(c,a,b)
        else:
            print(c,b,a)
```

Here's a modified version of the above code that achieves the same result but is more concise and readable:
```
EX:2
# Get three numbers from the user
a = int(input("Enter first number: "))
b = int(input("Enter second number: "))
c = int(input("Enter third number: "))

# Sort the numbers and print them
if a < b < c:
    print(a, b, c)
elif a < c < b:
    print(a, c, b)
elif b < a < c:
    print(b, a, c)
elif b < c < a:
    print(b, c, a)
elif c < a < b:
    print(c, a, b)
elif c < b < a:
    print(c, b, a)
```

```
# EX:3

# Get three numbers from the user
a = int(input("Enter first number: "))
b = int(input("Enter second number: "))
c = int(input("Enter third number: "))

# Sort the numbers and print them
print(*sorted([a, b, c]))
```

```
# Ex : 4  Here's a modified version of the code:

else:
    print(c, min(a, b), max(a, b))
```
This code achieves the same result as the original code, but is more concise and readable. The min() and max() functions are used to determine the order of a and b, and the result is printed with c as the first element.

Here's a breakdown of the code:

Code Explanation
*else:*
This line indicates that the code within this block will execute if none of the preceding conditions in the if-elif chain are met.

*print(c, min(a, b), max(a, b))*
This line prints the values of c, min(a, b), and max(a, b).

*min(a, b)*
This function returns the smaller of the two values a and b.

*max(a, b)*
This function returns the larger of the two values a and b.

How it works
When this code executes, it prints the value of c first, followed by the smaller of a and b, and finally the larger of a and b. This effectively sorts the three values in ascending order.

Example
Suppose c = 1, a = 3, and b = 2. The code would print:


1 2 3


**Here's a simple way to sort three numbers in ascending order without using any built-in sorting functions:**

```
# EX: 5
a = int(input("Enter first number: "))
b = int(input("Enter second number: "))
c = int(input("Enter third number: "))

if a <= b and a <= c:
    smallest = a
elif b <= a and b <= c:
    smallest = b
else:
    smallest = c

if a >= b and a >= c:
    largest = a
elif b >= a and b >= c:
    largest = b
else:
    largest = c

middle = a + b + c - smallest - largest

print("Sorted order:", smallest, middle, largest)
```

This code compares the numbers to find the smallest and largest, and then calculates the middle value by subtracting the smallest and largest from the sum of all three numbers.








```
Ex: 
marks = int (input("Enter your Marks : "))

if marks >= 90:
    print("Grade : A+")
elif marks >= 80:
    print("Grade : A")
elif marks >= 70:
    print("Grade : B+")
else:
    print("Grade : C+")
```

***Here's a modified version of the code that's more concise and readable:***

```
marks = int(input("Enter your Marks: "))

if marks >= 90:
    grade = "A+"
elif marks >= 80:
    grade = "A"
elif marks >= 70:
    grade = "B+"
else:
    grade = "C+"

print(f"Grade: {grade}")
```

***Or, if you want to make it even more concise:***

```
marks = int(input("Enter your Marks: "))

grade = "A+" if marks >= 90 else "A" if marks >= 80 else "B+" if marks >= 70 else "C+"

print(f"Grade: {grade}")
```
Both versions achieve the same result, but the second one is more compact. However, the first version is more readable and easier to understand.


    

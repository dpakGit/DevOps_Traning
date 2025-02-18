https://www.w3schools.com/go/go_nested_if.php

https://www.geeksforgeeks.org/nested-if-statement-in-python/?ref=header_ind

https://www.tutorialspoint.com/python/nested_if_statements_in_python.htm


**Examples**

**Number Classification Code**

- Program to classify Numbers as Positive, Negative, or Zero

```
# EX: 1
num = int(input("Enter the number : "))
if num > 0:
    print(num,"is a positive number")

else:
    if num < 0:
        print(num,"is a negative number")
    else:
        print("The number is Zero")
```

```
# EX: 2  Try this, it is my code and see the output

num = int(input("Enter the number : "))
if num < 0:
    print(num,"is a negative number")
    if num == 0:
        print("The number is Zero")
else:
    print(num, "is a positive number")
```

```        
# Ex: 3 My code using Nested If Else Statement

num = int(input("Enter the Number: "))

if num > 0:
    print(num,"is a positive number") 
    if num % 2 == 0:
        print(num,"is an even number")
    else:
        print(num, " is an odd number")
elif num == 0:
    print(" The number is Zero")
else:
    if num < 0:
        if num % 2 == 0:
            # print(num,"is a negative number")
            print(num,"is an Negative even number")
        else:
            # print(num,"is a negative number")
            print(num, " is an Negative odd number")
```

```
# Ex: 3.1
# Here's a modified version of the code with improved structure and readability also a simple one:
# Source Meta

num = int(input("Enter the Number: "))

if num > 0:
    print(num, "is a positive number")
elif num < 0:
    print(num, "is a negative number")
else:
    print("The number is Zero")

if num % 2 == 0 and num != 0:
    print(num, "is an even number")
elif num != 0:
    print(num, "is an odd number")
```

```
# Ex: 3.2
# Alternatively, you can combine the two conditions into a single set of if-elif-else statements:

num = int(input("Enter the Number: "))

if num > 0:
    print(num, "is a positive", end=" ")
elif num < 0:
    print(num, "is a negative", end=" ")
else:
    print("The number is Zero")
    exit() # Note this line

if num % 2 == 0:
    print("even number")
else:
    print("odd number")
```

Output of Ex 3.1 and 3.2 are same.


Q. Explain the use of **"end="** in the code of Example 3.2 ?

Sol:

**In Python, the print() function automatically appends a newline character (\n) at the end of its output. This means that each time you call print(), it will start printing on a new line.**

The end= parameter in the print() function allows you to change this behavior. By specifying a value for end=, you can control what character is appended to the end of the output instead of the default newline character.

In the code snippet I provided earlier:

print(num, "is a positive", end=" ")
print("even number")

The end=" " parameter tells Python to append a space character instead of a newline character after printing the first statement. This means that the next print() statement will continue printing on the same line, instead of starting a new line.

So, the output will be:

5 is a positive even number

Instead of:

5 is a positive
even number

By using end=" ", we can create a more concise and readable output.

Q. If the number is a positive number python will pick up the following line, but how will it know which line to pick from  print("even number") or   print("odd number") ?

Sol:

The key to understanding this is the if-elif-else structure that precedes the print() statements.

Here's the relevant code snippet again:

if num > 0:
    print(num, "is a positive", end=" ")
elif num < 0:
    print(num, "is a negative", end=" ")
else:
    print("The number is Zero")
    exit()

if num % 2 == 0:
    print("even number")
else:
    print("odd number")

The first if-elif-else block determines whether the number is positive, negative, or zero. If the number is positive, it prints the corresponding message and then continues executing the next lines of code.

The next lines of code are the second if-elif-else block, which determines whether the number is even or odd. This block is not conditional on the first block, meaning that it will always be executed, regardless of whether the number is positive, negative, or zero (although, in the case of zero, the exit() function will terminate the program).

So, when the number is positive, the program will:

1. Print the positive message
2. Continue executing the next lines of code
3. Evaluate the second if-elif-else block to determine whether the number is even or odd
4. Print the corresponding even or odd message

This is why the program knows which line to pick from print("even number") or print("odd number"): it's simply executing the next lines of code in sequence!


Q. So this way the code will use the end=" " and print the output of the second line ?

Sol:

That's exactly what happens.

By using end=" ", the first print() statement doesn't append a newline character, so the next print() statement continues printing on the same line.

As a result, the output of the two print() statements is combined into a single line, like this:

5 is a positive even number

Instead of:

5 is a positive
even number

The end=" " trick allows you to create a more concise and readable output by combining the two messages into a single line.


Q. Explain the use case of  end=" " in the  print(num, "is a positive", end=" ") ?

Sol:
The end=" " in the print() function is used to:

1. Suppress the newline character: By default, print() appends a newline character (\n) at the end of its output. By setting end=" ", you're telling Python to append a space character instead of a newline character.
2. Continue printing on the same line: As a result of suppressing the newline character, the next print() statement will continue printing on the same line, instead of starting a new line.

In the specific use case of print(num, "is a positive", end=" "), the end=" " serves two purposes:

- It allows the next print() statement to continue printing on the same line, creating a more concise and readable output.
- It adds a space character between the two messages, making the output more readable and visually appealing.

For example, without end=" ", the output would be:

5 is a positive
even number

With end=" ", the output becomes:

5 is a positive even number

The end=" " trick is commonly used in Python to create more readable and concise output, especially when working with multiple print() statements.

Q. Newline character meaning ?

Sol:

In computing, a newline character (also known as a line break or end-of-line character) is a special character that indicates the end of a line of text.

When a newline character is encountered, the text cursor moves to the beginning of the next line, and any subsequent text is printed on that new line.

In other words, a newline character is like a "carriage return" that says, "Hey, I'm done with this line. Move to the next one!"

In programming, newline characters are often represented by the following escape sequences:

- \n (Unix, Linux, and macOS)
- \r\n (Windows)

When you print text with a newline character at the end, it will start a new line in the output. For example:

print("Hello, world!\nThis is a new line.")

Output:

Hello, world!
This is a new line.

In the context of the print() function, the end parameter controls whether a newline character is appended to the output. By default, end='\n', which means a newline character is added at the end of the output. But by setting end='' or end=' ', you can suppress the newline character and continue printing on the same line.



# ``````````````````````````````````````````````````


Q. Where is the most suitable location for a nested loop: within an if statement, an elif clause, or an else block?

Sol: The most suitable location for a nested loop depends on the specific logic and requirements of your code. However, here are some general guidelines:

- If statement: Use a nested loop within an if statement when you want to iterate over a collection or perform a repetitive task only when a certain condition is true.

- Elif clause: Use a nested loop within an elif clause when you want to iterate over a collection or perform a repetitive task only when a specific alternative condition is true.

- Else block: Use a nested loop within an else block when you want to iterate over a collection or perform a repetitive task only when all other conditions are false.

In general, the nested loop should be placed where it makes the most logical sense based on the flow of your program and the conditions you're checking.

Here's an example:
```
if condition1:
    # Perform task A
    for item in collection:
        # Perform task B for each item
        pass
elif condition2:
    # Perform task C
    for item in collection:
        # Perform task D for each item
        pass
else:
    # Perform task E
    for item in collection:
        # Perform task F for each item
        pass
```

Q. Give one example each for if statement, Elif and else ?

Sol:

Here are three examples:

**If Statement Example**

```
x = 5
if x > 10:
    for i in range(5):
        print(i)
```

In this example, the nested loop will not execute because the condition x > 10 is false.


**Elif Clause Example**

```
x = 5
if x > 10:
    print("x is greater than 10")
elif x == 5:
    for i in range(5):
        print(i)
```

In this example, the nested loop will execute because the condition x == 5 is true.


**Else Block Example**

```
x = 15
if x > 20:
    print("x is greater than 20")
elif x == 10:
    print("x is equal to 10")
else:
    for i in range(5):
        print(i)
```

In this example, the nested loop will execute because the conditions in the if and elif clauses are false, so the program falls through to the else block.


Q. Give one  individual example each for if statement, Elif and else statement where a nested loop is used ?

Sol:
Here are three individual examples:

**If Statement Example**

```
x = 5
if x > 0:
    for i in range(3):
        for j in range(2):
            print(f"i: {i}, j: {j}")
```

Output:

i: 0, j: 0

i: 0, j: 1

i: 1, j: 0

i: 1, j: 1

i: 2, j: 0

i: 2, j: 1


**Elif Clause Example**

```
x = 0
if x > 10:
    print("x is greater than 10")
elif x == 0:
    for i in range(3):
        for j in range(2):
            print(f"i: {i}, j: {j}")
```

Output:

i: 0, j: 0
i: 0, j: 1
i: 1, j: 0
i: 1, j: 1
i: 2, j: 0
i: 2, j: 1


**Else Block Example**

```
x = -5
if x > 0:
    print("x is positive")
elif x == 0:
    print("x is zero")
else:
    for i in range(3):
        for j in range(2):
            print(f"i: {i}, j: {j}")

```
Output:

i: 0, j: 0
i: 0, j: 1
i: 1, j: 0
i: 1, j: 1
i: 2, j: 0
i: 2, j: 1






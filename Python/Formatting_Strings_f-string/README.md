## Python f-string

Reference Links:
1. https://www.programiz.com/python-programming/fstring

2. https://www.w3schools.com/python/python_string_formatting.asp

3. https://realpython.com/python-string-formatting/#using-f-strings-to-format-strings

4. https://www.geeksforgeeks.org/python-string/?ref=shm

5. https://www.tutorialspoint.com/python/python_string_formatting.htm


Q. What is the meaning of formatting a string in python ?

Sol:
Formatting a string in Python refers to the process of inserting values or expressions into
a string, often with specific formatting options such as alignment, padding, precision, and more.

In other words, string formatting allows you to:

1. Insert values into a string

2. Control the format of those values (e.g., decimal places, alignment)

3. Create a new string with the inserted values and formatting

There are several ways to format strings in Python:

1. % operator: Uses the % operator to insert values into a string.

2. str.format(): Uses the format() method to insert values into a string.

3. f-strings: Uses the f prefix before a string literal to insert values into a string.

Here are some examples:

**% operator**

```
name = "John"
age = 30
print("My name is %s and I am %d years old." % (name, age))
```

**str.format()**

```
name = "John"
age = 30
print("My name is {} and I am {} years old.".format(name, age))
```

**f-strings**

```
name = "John"
age = 30
print(f"My name is {name} and I am {age} years old.")
```

String formatting is a powerful feature in Python that allows you to create **dynamic strings** with ease!
   

```
Ex: 1
name = "Madhav"
age = 25
print(f"my nane is {name} and I am {age}.")

# You can also perform expression inside the placeholders
print(f"In five years I will be {age + 5} years old.")
```


Q. What is the difference between the two print statements in the following code - 

```
name = "abc"
age = 24
print("My name is",name, "and my age is",age) # 1
print(f"My name is {name}, and my age is {age}") # 2
```

Sol:

The two print statements in the code produce the same output:


My name is abc and my age is 24
My name is abc, and my age is 24


However, there are some differences between the two print statements:

1. Syntax: The first print statement uses the comma-separated syntax, where each argument is separated by a comma. The second print statement uses an **f-string, which is a more modern way of formatting strings.**

2. String Formatting: In the first print statement, Python automatically inserts a space between each argument. In the second print statement, you have more control over the formatting, and you can specify exactly how you want the string to look.

3. Readability: Many developers find f-strings more readable, especially for complex string formatting. With f-strings, you can clearly see the structure of the string and how the variables are being inserted.

4. Performance: F-strings are also faster than the comma-separated syntax, because they avoid the overhead of creating a tuple of arguments.

In summary, while both print statements produce the same output, the f-string version is generally more readable, flexible, and efficient.


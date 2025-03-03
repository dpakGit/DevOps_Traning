**Date : 3.3 2025**

Reference Links:

1. https://www.w3schools.com/python/python_strings.asp

2. https://www.geeksforgeeks.org/python-string/?ref=shm

3. https://www.tutorialspoint.com/python/python_string_formatting.htm

4. https://www.programiz.com/python-programming/string  


```
print('Hello world')
print("Hello world")
print('''Hello world''')

print('It's easy')  # Incorrect code 
# SyntaxError: unterminated string literal (detected at line 789)

print("It's easy") # Correct code

print('"test - 1"')

print(' '''Test-2''' ') # Incorrect code
SyntaxError: unterminated triple-quoted string literal (detected at line 795)

print(''' 'Test-3' ''') # Incorrect

print(" '''Test-4'''' ")
print(''' "Test-5" ''')

print("Print yhe word Quotes with in double quotes - "QUOTES" ")

print(''' Print the word Quotes with in double quotes - "QUOTES"  ''') # Correct

print(''' Print the word Quotes with in double quotes - "QUOTES"  ''') # Correct
or

print(''' Print the word Quotes with in double quotes - \"QUOTES\"  ''') # Correct
print("\"back slash double quotes\"")

```


Q. Explain how baclslash and double quotes is working in the following code
 - print("\"back slash double quotes\"")

Sol:Meta AI

Let's break down the code:


```print("\"back slash double quotes\"")```


Here's what's happening:

1. **The print() function is used to output the string to the console.**
2. The string is enclosed in double quotes ("...").
3. Inside the string, there's a backslash (\) followed by a double quote (").

Now, here's the important part:

- **In Python, the backslash (\) is an escape character. It's used to introduce special characters or escape sequences.**
- When the backslash is followed by a double quote ("\"), it's treated as an escape sequence. The backslash "escapes" the double quote, telling Python to treat it as a literal character instead of the end of the string.

So, in this case, the backslash is used to:

- Escape the double quote, allowing it to be included in the string.
- Print the double quote as a literal character, rather than using it to delimit the string.

When you run this code, the output will be:


"back slash double quotes"


As you can see, the double quotes are printed literally, thanks to the escaping effect of the backslash.

Here are some more examples to illustrate this:

```
print("Hello \"World\"!")  # Output: Hello "World"!
print("\"This\" is a test.")  # Output: "This" is a test.
```


### #  % operator

```
# EX:1
name = "madhav"
age = 24
print("my name is %s and my age is %d" %(name,age))
```

Explanation of the above code:

Let's break down the above code:

This code uses Python's string formatting feature to insert the values of name and age into a string.

Here's what's happening:

1. name and age are assigned the values "madhav" and 24, respectively.
2. The print() function is used to output a string to the console.
3. The string contains two **placeholders: %s and %d.**
    - %s is a placeholder for a string value.
    - %d is a placeholder for an integer value.
4. The % operator is used to insert the values of name and age into the string.
5. The values are **inserted in the order** they appear in the tuple (name, age).

When you run this code, the output will be:


my name is madhav and my age is 24


Here's how the string formatting works:

- %s is replaced with the string value "madhav".
- %d is replaced with the integer value 24.

Note that this style of string formatting is older and less commonly used in modern Python code. Instead, you might see f-strings (introduced in Python 3.6) or the str.format() method used for string formatting.

For example, here's the equivalent code using f-strings:


name = "madhav"
age = 24
print(f"my name is {name} and my age is {age}")


Q. print("my name is %s and my age is %d" % (name, age))
is it that,here %s is mapping the value assigned to name and % d is mapping the value assigned to age ?

Sol:
That's absolutely correct!

In the code:

print("my name is %s and my age is %d" % (name, age))


- %s is a placeholder for a string value, and it's mapping the value assigned to name.
- %d is a placeholder for an integer value, and it's mapping the value assigned to age.

The % operator is used to replace the placeholders (%s and %d) with the actual values of name and age, respectively.

So, when you run this code, the output will be:

my name is madhav and my age is 24


Where:

- madhav is the value assigned to name, which replaces the %s placeholder.
- 24 is the value assigned to age, which replaces the %d placeholder.

Great job understanding the code!

Q. How is the Following line working and how %s and %d are replaced by the values in the variable name and age ?

```print("my name is %s and my age is %d" % (name, age))```
   
Sol: 
Let's break down the line:

Here's what's happening:

1. The string "my name is %s and my age is %d" is created with two placeholders: %s and %d.
2. The % operator is used to replace the placeholders with the actual values.
3. The values to replace the placeholders are provided in the tuple (name, age).
4. The % operator matches the placeholders with the values in the tuple, based on their position.

Here's the step-by-step replacement:

1. %s is replaced with the first value in the tuple, which is name. So, %s becomes "madhav".
2. %d is replaced with the second value in the tuple, which is age. So, %d becomes "24".

The resulting string after replacement is:


"my name is madhav and my age is 24"


This final string is then printed to the console.

Note that the % operator is using the values in the tuple (name, age) to replace the placeholders in the string. The order of the values in the tuple matters, as it determines which value replaces which placeholder.

Q. But this is also printing the same result -

```print("my name is %s and my age is %s" %(name,age))```

how ?

Sol:
You're right, the code:


print("my name is %s and my age is %s" % (name, age))


is also printing the same result:


my name is madhav and my age is 24


Here's why:

**In Python, when you use the %s placeholder, it's a generic placeholder that can handle any type of object, including strings, integers, floats, and more.**

When you pass an integer value like age to the %s placeholder, Python automatically converts the integer to a string using the str() function.

So, in this case:

- name is already a string, so it's printed as is.
- age is an integer, but it's converted to a string using str() before being printed.

As a result, both %s placeholders are replaced with string values, and the output is the same as before.

Note that if you want to format integers or floats with specific formatting options (e.g., decimal places, padding), you should use the %d or %f placeholders instead of %s.



```
# EX:2
name = "madhav"
age = 24
print("my name is %s and my age is %s" %(name,age))
```
```
# EX:3
name = "madhav"
age = 24
print("my name is %d and my age is %s" %(age,name))
```

```
# EX:4
name = "madhav"
age = 24
print("Test-1 %s %d" %(name,age))

print("Test-2 %s %s" % (name, age))
# output: Test-2 madhav 24, this is printing the age even if it is %s as it is considering age as a string

print("Test-3 %d %d" % (name, age))
# Output : TypeError: %d format: a real number is required, not str, bit here it is not considering an integer as a string

print("%d %s" %(name,age))
# output : TypeError: %d format: a real number is required, not str
```


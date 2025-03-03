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

print("Test-2 %s %s" % (name, age)) # output: Test-2 madhav 24, this i printing the age even if it is %s as it is considering age as a string

print("Test-3 %d %d" % (name, age)) # Output : TypeError: %d format: a real number is required, not str, bit here it is not considering an integer as a string

print("%d %s" %(name,age)) # output : TypeError: %d format: a real number is required, not str
```

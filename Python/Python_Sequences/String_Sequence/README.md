## String Sequence in Python

Reference links:

1. https://studyglance.in/python/string.php

- Meta AI

  In Python, string indexing is a way to access individual characters in a string.

Indexing Basics

In Python, strings are zero-indexed, meaning that the first character in the string is at index 0.

Here's an example:


my_string = "hello"


The indices for this string would be:


h (0)
e (1)
l (2)
l (3)
o (4)


Accessing Characters

To access a character at a specific index, you can use square brackets [] with the index number:


my_string = "hello"
print(my_string[0])  # Output: "h"
print(my_string[1])  # Output: "e"


Negative Indexing

Python also supports negative indexing, which starts counting from the end of the string.

Here's an example:


my_string = "hello"
print(my_string[-1])  # Output: "o"
print(my_string[-2])  # Output: "l"


Indexing Errors

If you try to access an index that's out of range (either too high or too low), Python will raise an IndexError:


my_string = "hello"
print(my_string[10])  # IndexError: string index out of range


I hope this helps you understand string indexing in Python!


**Python String indexing**

**Negative Indexing**

Here's a practical use case for negative indexing:

Use Case: Extracting the last character of a string

Imagine you have a string and you want to extract the last character. Without negative indexing, you would need to calculate the length of the string and then access the character at that index.

Here's an example:


my_string = "hello"
last_char = my_string[len(my_string) - 1]
print(last_char)  # Output: "o"


With negative indexing, you can simplify this to:


my_string = "hello"
last_char = my_string[-1]
print(last_char)  # Output: "o"


As you can see, negative indexing makes it easy to access the last character of a string without having to calculate the length.

You can also use negative indexing to extract the last few characters of a string. For example:


my_string = "hello"
last_two_chars = my_string[-2:]
print(last_two_chars)  # Output: "lo"


Practice:

```
Ex:1
str = "HELLO"
print(str[-1])
print(str[-2])
print(str[-3])
print(str[-4])
print(str[-5])
```

**Note:-**
A string can only be replaced with a new string since its content cannot be partially replaced. Strings are immutable in python.

str[0] = "B" ☒    can´t replace a single character in a string

str = "BYE" ☑    can replace a new string

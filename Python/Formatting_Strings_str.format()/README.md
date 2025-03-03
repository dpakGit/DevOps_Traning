## Using str.format() to Format Strings:

Reference Links:

1. https://realpython.com/python-string-formatting/#using-strformat-to-format-strings

```
# Ex: 1

name = "john"
age = 24
print("Ex -1: My name is {} and i am {}." .format(name,age))
```


```
# Ex: 2

name = "mohan"
age = 25
print("Ex -2: My name is {0} and i am {1}." .format(name,age))
```


```
# Ex: 3

name = "john"
age = 24
print("Ex -1: My name is {} and i am {}." .format(name = "Charlie",age = 26))
```
Output: IndexError: Replacement index 0 out of range for positional args tuple


Why the above code is showing an error ?

Sol:
The issue here is that you're mixing up two different ways of using the format() method.

When you use .format(name="Charlie", age=26), you're using named placeholders, which means you should have {name} and {age} in your string, not just {}.

However, when you use {} in your string, it's expecting a positional argument, not a named one.

To fix this, you can either use positional arguments:

```
name = "john"
age = 24
print("Ex -1: My name is {} and i am {}.".format("Charlie", 26))

#Or, you can use named placeholders:

name = "john"
age = 24
print("Ex -1: My name is {name} and i am {age}.".format(name="Charlie", age=26))
```

Either way, you should be able to get the output you're looking for!


```
# Ex: 4 new values are overridden by old values.

name = "Madhav"
age = 27
print("Ex -4: My name is {name} and i am {age}." .format(name = "Charlie",age = 28))
```


```
# Ex: 5 Individual without Declaring the variables outside the print function

print("Ex -1: My name is {name} and i am {age}." .format(name = "Charlie",age = 26))
```

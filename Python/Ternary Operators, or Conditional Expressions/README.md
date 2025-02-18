## Ternary Operators, or Conditional Expressions.

Scroll down the page in the following link to find Ternary Operators, or Conditional Expressions:

https://www.w3schools.com/python/python_conditions.asp#gsc.tab=0

https://www.geeksforgeeks.org/ternary-operator-in-python/?ref=header_ind

https://sparkbyexamples.com/python/python-ternary-conditional-operator/

                                                                                                                                                                                                                                                                            
**The syntax for Python's ternary operator is:**

```("value_if_true")  if [condition]  else  ("value_if_false")```


Here's a breakdown:

- condition: This is the condition to be evaluated.
- value_if_true: This is the value returned if the condition is true.
- value_if_false: This is the value returned if the condition is false.

Example:
```
x = 5
result = "x is positive" if x > 0 else "x is not positive"
print(result)  # Output: x is positive
```

This is equivalent to:

```
x = 5
if x > 0:
    result = "x is positive"
else:
    result = "x is not positive"
print(result)  # Output: x is positive
```

Also:
Alternatively, you can use a multiline format Syntax for even better readability:
```
result = (
    "x is positive" 
    if (x > 0) 
    else "x is not positive"
)
```



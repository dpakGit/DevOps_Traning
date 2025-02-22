**Reference Links :**

1. https://www.programiz.com/python-programming/function


```
EX:1

def hello() -> None:
    """
    Prints a message "Hello !".
    """
    print("Hello!")

# Function Call Syntax:

hello()  # Output: Hello!
```


```
EX: 2

def print_name(name):

    """Prints the provided name"""

    print(name)

# Function Call Syntax:
print_name("John") # Output - John
```

```
EX: 3

# Wrong code

def square(x):
    """
    This function takes a number as input and returns its square
    """
    return x ** 2
    x = float(input("Enter a Number: "))
    out = square(x)
    print("The square of", x, "is" , out)


# Function Call
x = float(input("Enter a number: "))
out = square(x)

print("The square of", x, "is", out)
```


```
EX: 4

def square(a):
    """
    This function takes a number as input and returns its square
    """
    return a ** 2

# code body
x = float(input("Enter a number: ")) # input call
out1 = square(x)                     # Function Call

y = float(input("Enter a number: "))
out2 = square(y)

z = float(input("Enter a number: "))
out3 = square(z)

print("The square-1 of", x, "is", out1)

print("The square-2 of", y, "is", out2)

print("The square-3 of", z, "is", out3)
```


```
EX: 5

def confirmation_message(name,location):
    text_1 = "Start packing your bags " + name + " !"
    text_2 = " You Have successfully booked a trip to " + location + "."

    full_text = text_1 + text_2
    return full_text

# Function call:

print(confirmation_message("Ajay","Kerala"))
# print(confirmation_message("Bijay","Mumbai"))
# print(confirmation_message("Mohan","Assam"))
```



https://www.programiz.com/python-programming/function#:~:text=Example%3A%20Function%20to%20Add%20Two%20Numbers&text=Output%20Sum%3A%209-,In%20the%20above%20example%2C%20we%20have%20created%20a%20function%20named,with%20arguments%3A%20num1%20and%20num2%20.&text=Parameters%20are%20the%20variables%20listed,accept%20when%20we%20call%20them.

Following lines are from the above link:

**Parameters and Arguments**


**Parameters**

Parameters are the variables listed inside the parentheses in the function definition. They act like placeholders for the data the function can accept when we call them.

Think of parameters as the blueprint that outlines what kind of information the function expects to receive.

def print_age(age):  # age is a parameter
    print(age)
In this example, the print_age() function takes age as its input. However, at this stage, the actual value is not specified.

The age parameter is just a placeholder waiting for a specific value to be provided when the function is called.


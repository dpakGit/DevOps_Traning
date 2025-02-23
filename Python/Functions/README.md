**Reference Links :**

1. https://www.programiz.com/python-programming/function



**Examples:**


```
EX:1  Function without parameters

def hello() -> None: Without parameters
    """
    Prints a message "Hello !".
    """
    print("Hello!")

# Function Call Syntax: without parameters

hello()  # Output: Hello!
```


```
EX: 2 Function with parameters

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

**Python Program to Calculate the Area of a Circle Using a Custom Function**

```
Ex : User-Defined Function in Python to Compute the Area of a Circle
def area_of_circle(a):
    pi = 3.14159
    return pi * a **2

# Code body
r = float(input("Enter radius of the circle: "))

# Function call

Area = area_of_circle(r)
print("The area of the circle is : ", Area)
```


Q. what is the difference between the following two code in terms of their output ?

Sol: Meta

**Code 1: Without the use of "return"**

```
def sum_1(a,b):
    sum = a+b
    print("The result of first function is:", sum)

result_1 = sum_1(4,5)
print("Data type of the first result/first sum is : ", type(result_1))
```

Output:

The result of first function is: 9

Data type of the first result/first sum is :  **<class 'NoneType'>**


**Code 2: With the use of "return"**

```
def sum_2(a,b):
    return a+b

result_2 = sum_2(6,9)
print("The result of second function is:", result_2)
print("Data type of the second result/second sum is : ", type(result_2))
```

Output:

The result of second function is: 15

Data type of the second result/second sum is :  **<class 'int'>**

The key differences between the two code snippets are:

1. Return value: In Code 1, the sum_1 function does not explicitly return a value, so it implicitly returns None. In Code 2, the sum_2 function explicitly returns the sum of a and b.

2.  Data type of result: As a result of the return value difference, the data type of result_1 is NoneType, while the data type of result_2 is int.

3. Printing behavior: In Code 1, the sum_1 function prints the result directly, whereas in Code 2, the result is returned and then printed by the caller.

In summary, using the return statement in Code 2 allows the function to return a meaningful value, which is then printed by the caller. In contrast, Code 1's function prints the result directly and returns None.



Q. Why output of the first code or data type is "none" ?

Sol: Meta

In the first code, the sum_1 function does not explicitly return a value. In Python, when a function does not explicitly return a value, it implicitly returns None.

Here's what happens when you call the sum_1 function:

1. The function executes and calculates the sum of a and b.

2. The function prints the result directly using print("The result of first function is:", sum).

3. Since there is no explicit return statement, the function implicitly returns None.

4. The caller assigns the return value of the function to the variable result_1.

5. Since the function returned None, the variable result_1 is assigned the value None.

When you print the data type of result_1 using type(result_1), you get <class 'NoneType'> because the value of result_1 is indeed None.

To avoid this, you can modify the sum_1 function to explicitly return the sum, like this:

```
def sum_1(a,b):
    sum = a+b
    print("The result of first function is:", sum)
    return sum
```

By adding the return sum statement, you ensure that the function returns the calculated sum instead of None.

Q. Explain the diference between explicit return and  implicitly return ?

Sol:
In programming, a return statement is used to exit a function and send a value back to the caller. There are two types of return statements: explicit return and implicit return.

**Explicit Return:**

An explicit return statement is a statement that is explicitly written in the code to return a value from a function. It is typically written using the return keyword followed by the value to be returned.

Example:
```
def add(a, b):
    result = a + b
    return result
```
In this example, the return statement is explicitly written to return the result variable.

**Implicit Return:**

An implicit return statement is not explicitly written in the code, but it is implied by the language. In Python, if a function does not contain an explicit return statement, it will implicitly return None.

Example:

```
def greet(name):
    print(f"Hello, {name}!")
```
In this example, there is no explicit return statement, so the function will implicitly return None.

Key differences:

1. Explicitness: An explicit return statement is explicitly written in the code, while an implicit return statement is implied by the language.

2. Return value: An explicit return statement returns a specific value, while an implicit return statement returns None.

3. Control: An explicit return statement gives the programmer control over what value is returned, while an implicit return statement does not provide this control.

4. Readability: Explicit return statements can make the code more readable, as they clearly indicate what value is being returned.

In general, it's a good practice to use explicit return statements to make the code more readable and maintainable. However, implicit return statements can be useful in certain situations, such as when a function is only used for its side effects (e.g., printing to the console).



**More Examples:**

**Function to convert celsius to Fahrenheit- return statement**

``` 
def celsius_to_fahrenheit(celsius):
    fahrenheit = (celsius * 9/5) + 32 
    return fahrenheit 

# Call function 
temp_f = celsius_to_fahrenheit(25) 
print(temp_f)
print("with return: ", type(temp_f))
```

Output :
77.0

With return:  <class 'float'>

**Function to convert celsius to Fahrenheit- without return**

```
def celsius_to_fahrenheit(celsius):
    fahrenheit = (celsius * 9/5) + 32 
    print(fahrenheit)  

# Call function 
temp_f2 = celsius_to_fahrenheit(50) 
print("without return: ", type(temp_f2)) 
```

output:
122.0

Without return:  <class 'NoneType'>




-
-
-
.............................................................................................
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


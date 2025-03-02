# Python Function Arguments

Reference Links : 

1. https://www.w3schools.com/python/python_functions.asp#gsc.tab=0

2. https://www.geeksforgeeks.org/python-functions/?ref=header_ind

3. https://www.tutorialspoint.com/python/python_keyword_arguments.htm

4. https://www.programiz.com/python-programming/function-argument  



## Python Function Arguments

**Date 24.2.2025**

```
def greetings(name):
    print("hello", name,"!" )

# function call
greetings("Ajay")
```

**Multiple Arguments**

```
def sum(a,b,c,d):
    return a + b + c + d

# Function Call
print("Sum of the numbers =", sum(10,20,30,40))
```

## Required Arguments


## Default Argument

```
def greet(name = "Default_Argument"):
    print("Hi", name, "!")

# Function Call

greet()

greet("Deepak")
```

https://www.w3schools.com/python/python_functions.asp#gsc.tab=0

```
Ex:2
def my_function(country = "Norway # this was a default value provided"): # Default argument
  print("I am from " + country)

my_function("Sweden")
my_function("India")
my_function("Brazil")
my_function()
```

https://www.tutorialspoint.com/python/python_default_arguments.htm

```
Ex: 3
def showinfo( name, city = "Hyderabad" ):
   "This prints a passed info into this function"
   print ("Name:", name)
   print ("City:", city)
   return

# Now call showinfo function
showinfo(name = "Ansh", city = "Delhi")
showinfo(name = "Shrey")
```


**Function to calculate simple interest:**

```
def calculate_simple_interest(principal, time, rate):
    """
    Calculate simple interest based on principal, time, and rate.
    
    Args:
        principal (float): The initial amount of money.
        time (float): The time period in years.
        rate (float): The interest rate as a percentage.
    
    Returns:
        float: The calculated simple interest.
    """
    return (principal * time * rate) / 100

# Function call
principal_amount = 100
time_period = 2
interest_rate = 10

simple_interest = calculate_simple_interest(principal_amount, time_period, interest_rate)

# Print the result
print(simple_interest)

```

Same code but very simple

```
def si(principal,time,rate):
    return (principal * time * rate)/100
     
# Function call
simple_interest = si(100,2,10)

print(si) # This is giving error

print(si(100,2,10))

print(simple_interest )
```

Q. Why this is givin error ?

Sol: Meta Ai 

The issue here is that you're printing the function object itself, not the result of the function call.

When you do print(si), you're printing the function object, which is why you see the output <function si at 0x0000021088291440>.

To print the result of the function call, you should print the simple_interest variable instead:

```
def si(principal,time,rate): 
    return (principal * time * rate)/100 

# Function call

simple_interest = si(100,2,10)

# Or
# Print the result

print(simple_interest)
```
This will output the calculated simple interest, which is 20.0.

**Default Type : 1**

```
def si(principal,time,rate = 10):
    return (principal * time * rate)/100
     
# Function call
simple_interest = si(100,5)

print(simple_interest )
```

**Default Type : 2**

```
def si(principal,time = 5 ,rate = 10):
    return (principal * time * rate)/100
     
# Function call
simple_interest = si(100)

print(simple_interest )
```

**Default Type : 3**

```
def si(principal = 100,time = 5,rate = 10):
    return (principal * time * rate)/100
     
# Function call
simple_interest = si()

print(simple_interest )
```

**Note:** 
In a function header, any parameter cannot have a default value unless all parameters appearing on its right have their default values

- In a function header, you can define parameters with default values. For example: def greet(name, message="Hello"):.
- However, there's a restriction: if a parameter has a default value, all parameters to its right must also have default values.
- In other words, you can't have a parameter with a default value followed by a parameter without a default value.

Here are some examples to illustrate this rule:

- Valid: def greet(name, message="Hello", punctuation="!")
- Valid: def greet(name, message, punctuation)
- Invalid: def greet(name, message="Hello", punctuation)
- Invalid: def greet(name="John", message, punctuation="!")

This rule helps avoid ambiguity when calling functions with default parameter values. It ensures that when you omit arguments for parameters with default values, the function knows exactly which parameters to use the default values for.

"Default parameter values are overridden by user-provided values during a function call."

Q. Is it that it helps map the exact values, provided during function call, with the parameters having no default values ?

Sol:

The rule helps ensure that when you call a function with a subset of arguments, Python can unambiguously map those arguments to the parameters without default values.

By requiring that all parameters to the right of a parameter with a default value also have default values, Python can avoid ambiguity when mapping arguments to parameters.

For example, consider the function def greet(name, message="Hello", punctuation="!"). If you call this function with only one argument, greet("John"), Python knows exactly which parameter to map that argument to: the name parameter.

But if the function were defined as def greet(name, message="Hello", punctuation), it would be ambiguous which parameter to map the argument "John" to. Is it the name parameter or the punctuation parameter? The rule helps avoid this ambiguity.

- "This rule ensures that provided values are unambiguously mapped to parameters without default values during a function call."


### Invalid Function call using or Invalid defaul value assignment

```
# Ex: 1
def si(principal =,time = 5,rate):
     return (principal * time * rate)/100
  
#Ex : 2
def si(principal = 100,time,rate = 10):
     return (principal * time * rate)/100
```


**Date : 27.2.2025**

 ### Keyword/Named Argument
 
```
def si(p,t,r):
    return (p * t * r)/100

# Function Call
simple_interest = si(p =2500,t = 5, r = 3)

print("Simple interest = ",simple_interest)
```

### Multiple Argument Type Example

```
def si(p, t, r):
    return (p * t * r)/100

# Function Call types

simple_interest = si(1000,t =5) # rate is passed as default value in function defination
print("1: ", simple_interest)

simple_interest = si(1000, t= 5, r = 12) # Value of rate changed
print("2: ",simple_interest)

simple_interest = si(1000,r = 12,t = 5)  
# principle value is positional argument, followed by  keyword argument for rate and time that
# are provided arbitarily and not sequentially
print("3: ",simple_interest)

simple_interest = si(p =1000,t = 5, r = 15) # Value of rate is changed to see if the previous value
#is overridden
print("4: ",simple_interest)

simple_interest = si(r = 15, t = 5,p = 1000) # all values provided using keyword argument
print("5: ",simple_interest)
```


## 28.2.2025

## Python args and kwargs:

https://realpython.com/python-kwargs-and-args/

use the exaples from the above link

Passing Multiple Arguments to a Function


```
def add(*args):
    return sum(args)
    
# Function Call -1
result = add(1,2)
print("Sum of the numbers =", result)

# Function Call -2
result = add(1,2,3)
print("Sum of the numbers =", result)

# Function Call -3
result = add(1,2,3,4)
print("Sum of the numbers =", result)

```

Above code explanation:


Function Definition

def add(*args):

    
    return sum(args)


- def add(*args):: This line defines a function named add that takes a variable number of arguments, represented by *args. The * symbol allows the function to accept any number of arguments, which are collected into a tuple called args.
- return sum(args): This line returns the sum of all the numbers in the args tuple. The sum() function is a built-in Python function that calculates the sum of all elements in an iterable (like a tuple or list).

Function Call


result = add(1, 2, 3, 4)


- add(1, 2, 3, 4): This line calls the add function with four arguments: 1, 2, 3, and 4. These arguments are collected into the args tuple.
- result =: The result of the function call is assigned to a variable named result.

Printing the Result


print("Sum of the numbers =", result)


- print(...): This line prints a message to the console.
- "Sum of the numbers =": This is a string literal that is printed before the result.
- result: The value of the result variable is printed after the string literal.

When you run this code, here's what happens:

1. The add function is called with four arguments: 1, 2, 3, and 4.
2. The args tuple is created with these four values.
3. The sum() function is called on the args tuple, returning the sum of all the numbers: 1 + 2 + 3 + 4 = 10.
4. The result of the function call (10) is assigned to the result variable.
5. The message "Sum of the numbers =" is printed, followed by the value of result (10).

The output will be:


Sum of the numbers = 10


```
# EX:2
def greet(*names):
    for name in names:
        print(f"Hello, {name}!")

greet("function_call-1" , "a")

greet("function_call-2",  "a" ,"b")

greet("function_call-3"  ,"a", "b","c")
```


**Note:** Arguments are stored as tuple


```
def add(*args):
    print(type(args)) # To dee the type of teh arguments whose output will be : <class 'tuple'>
    return sum(args)
    
# Function Call -1
result = add(1,2)
print("Sum of the numbers =", result)
```
Output: 
<class 'tuple'>
Sum of the numbers = 3


**Error:** When we run the followin code it give s the following error


```
sum(1,2,3,4)
print(sum)
```

When you write sum(1,2,3,4), you are calling the built-in sum function with the arguments 1, 2, 3, and 4. The sum function returns the sum of these numbers, which is 10.

However, when you write print(sum), you are not printing the result of the previous sum function call. Instead, you are printing the sum function object itself.

In Python, sum is a built-in function, and when you print it, you will see something like:


<built-in function sum>


This is because sum is a function object, and printing it displays its type and memory address.

If you want to print the result of the sum function call, you should assign the result to a variable and print that variable:


result = sum(1,2,3,4)      # Correct way of calling a function , Userdefined or Built-in 
print(result)  # Output: 10



**Error:**  TypeError: sum() takes at most 2 arguments (4 given)

Sol:

The error message TypeError: sum() takes at most 2 arguments (4 given) indicates that the sum function is being called with too many arguments.

The sum function actually takes two arguments:

1. An iterable (like a list or tuple)
2. An optional initial value

When you call sum(1, 2, 3, 4), you're passing four separate arguments, which is not what the sum function expects.

To fix this, you can pass the numbers as a single iterable, like a list or tuple:


result = sum([1, 2, 3, 4])
print(result)  # Output: 10

# Or

result = sum((1, 2, 3, 4))
print(result)  # Output: 10


**What if we call this function with a key word argument in the following way ?**

```
def greet(*names):
    for name in names:
        print(f"Hello, {name}!")

# Function call
greet(*names = "test-2")
    or
greet(names = "test-1")
```

- Error for function call test-1:

TypeError: greet() got an unexpected keyword argument 'names'

- Error for function call test-2:

  SyntaxError: cannot assign to iterable argument unpacking



- Meta Ai:

When you define a function with *names, it allows the function to accept a variable number of positional arguments. However, it does not allow keyword arguments.

If you try to call the function with a keyword argument, like greet(names="test-1"), you'll get a TypeError:


TypeError: greet() got an unexpected keyword argument 'names'


This is because the *names syntax only accepts positional arguments, not keyword arguments.

Now, if you try to call the function with greet(*names="test-2"), you'll get a SyntaxError:


SyntaxError: invalid syntax


This is because the * symbol is used to unpack iterables, but in this case, it's being used incorrectly.

To fix this, you can modify the function to accept keyword arguments using the **kwargs syntax:

```
def greet(*names, **kwargs):
    for name in names:
        print(f"Hello, {name}!")
    for key, value in kwargs.items():
        print(f"{key} = {value}")

# Now you can call the function with keyword arguments
greet("John", "Mary", names="test-1")
```

### Arbitrary Keyword Arguments, **kwargs

https://realpython.com/python-kwargs-and-args/

use the exaples from the above link



**Date : 2.3.2025**

```
# practice :
def show_info(**kwargs):
    print("Type is",type(kwargs)) # This command prints the type of value stored in the dictionary "kwargs"
    for key, value in kwargs.items():
        print(f"{key}: {value}")

# Function call
show_info(first_name="Deepak",middle_name="Ranjan", last_name="Mishra", city="Pune")
```

**Explanation of the above code** {Also see explanation a same code below}


Meta Ai

Let's break down this code step by step:

Defining a function with keyword arguments

```def show_info(**kwargs):```


- def is used to define a function.
- show_info is the name of the function.
- **kwargs is a special syntax in Python that allows the function to accept any number of keyword arguments. kwargs is a dictionary-like object that contains all the keyword arguments passed to the function.**

Iterating over keyword arguments:


```for key, value in kwargs.items():```


- kwargs.items() returns a view object that displays a list of a dictionary's key-value tuple pairs.
- The for loop iterates over each key-value pair in the kwargs dictionary.
- key and value are variables that take on the value of each key-value pair in the dictionary on each iteration.

Printing key-value pairs:


```print(f"{key}: {value}")```


- f-string is used to format the string.
- key and value are inserted into the string using {} placeholders.
- The resulting string is printed to the console.

Calling the function with keyword arguments:


```show_info(first_name="Deepak", middle_name="Ranjan", last_name="Mishra", city="Pune")```


- The show_info function is called with four keyword arguments: first_name, middle_name, last_name, and city.
- These keyword arguments are passed to the kwargs dictionary in the function.

When you run this code, the output will be:


first_name: Deepak
middle_name: Ranjan
last_name: Mishra
city: Pune


Q. Expalin the following syntax -" for key, value in kwargs.items():" ?

Sol. 
Let's break down the syntax:

for key, value in kwargs.items():

This is a for loop in Python that iterates over the key-value pairs of a dictionary-like object called kwargs.

Here's what's happening:

1. kwargs.items(): This method returns a view object that displays a list of a dictionary's key-value tuple pairs.
2. for key, value in ...: This is the for loop syntax. It's iterating over the key-value pairs returned by kwargs.items().
3. key, value: These are the variables that take on the value of each key-value pair on each iteration.

In other words, the for loop is unpacking each key-value pair into two separate variables: key and value.

Here's an example to illustrate this:

```
kwargs = {'name': 'John', 'age': 30}

for key, value in kwargs.items():
    print(f"Key: {key}, Value: {value}")
```

Output:


Key: name, Value: John
Key: age, Value: 30


In this example, the for loop iterates over the key-value pairs of the kwargs dictionary. On each iteration, the key variable takes on the value of the key (e.g., 'name'), and the value variable takes on the value of the corresponding value (e.g., 'John').


Q. Expalin the syntax : -  " value in kwargs.items():" and "kwargs.items():" ?

Sol:
Let's break down the syntax:

*kwargs.items():*

.items() is a method in Python dictionaries that returns a view object that displays a list of a dictionary's key-value tuple pairs.

In other words, .items() returns an iterable object that yields tuples containing each key-value pair in the dictionary.

Example:

```
kwargs = {'name': 'John', 'age': 30}
print(kwargs.items())
```

Output:


dict_items([('name', 'John'), ('age', 30)])


As you can see, .items() returns an iterable object containing tuples with each key-value pair.

*value in kwargs.items():*

This syntax is using the .items() method to iterate over the key-value pairs in the kwargs dictionary.

However, there's a small mistake in this syntax. It should be key, value in kwargs.items(): instead of value in kwargs.items():.

The correct syntax key, value in kwargs.items(): is using tuple unpacking to assign each key-value pair to the variables key and value.

Example:

```
kwargs = {'name': 'John', 'age': 30}
for key, value in kwargs.items():
    print(f"Key: {key}, Value: {value}")
```

Output:


Key: name, Value: John
Key: age, Value: 30


Q. Explain the following code - {Also see explanation a same code above}

```
def show_info(**kwargs): 
    print("Type is",type(kwargs))

    for key, value in kwargs.items():
        print(f"{key}:{value}")
        
#Function call
show_info(Name = "john", Age = 24, place = "london")
```

**Explanaton:**

Let's break down the code:

Defining a function with keyword arguments


def show_info(**kwargs):


- def is used to define a function.
- show_info is the name of the function.
- **kwargs is a special syntax in Python that allows the function to accept any number of keyword arguments. kwargs is a dictionary-like object that contains all the keyword arguments passed to the function.

Printing the type of kwargs


print("Type is", type(kwargs))


- This line prints the type of the kwargs object.
- type() is a built-in Python function that returns the type of an object.
- In this case, kwargs is a dictionary, so the output will be <class 'dict'>.

Iterating over keyword arguments:


for key, value in kwargs.items():
    print(f"{key}:{value}")


- This loop iterates over each key-value pair in the kwargs dictionary.
- kwargs.items() returns a view object that displays a list of a dictionary's key-value tuple pairs.
- for key, value in ... is the loop syntax. It's unpacking each key-value pair into two separate variables: key and value.
- print(f"{key}:{value}") prints each key-value pair in the format key:value.

Function call:


show_info(Name="john", Age=24, place="london")


- This line calls the show_info function with three keyword arguments: Name, Age, and place.
- The kwargs dictionary will contain these three key-value pairs.

When you run this code, the output will be:


Type is <class 'dict'>
Name:john
Age:24
place:london


```
# practice -1

def show_info(**kwargs):
    print("Type is",type(kwargs))

    for key, value in kwargs.items():
        print(f"{key}:{value}")
        

show_info(Name = "john", Age = 24, place = "london")
```


Modify the error in the following code:

```
def show_info(**kwargs):
    print(type(kwargs))

    for key, value in kwargs.items():
        print(f"{key}:{value}")
        

show_info(Name = "john", Age = 24, place = "london")
print("name is ", {key[0]})
modify the error
```

Here's the modified code:

```
def show_info(**kwargs):
    print(type(kwargs))
    for key, value in kwargs.items():
        print(f"{key}:{value}")

show_info(Name="john", Age=24, place="london")

# print the name, access the 'Name' key from the kwargs dictionary**

print("Name is ", kwargs['Name'])
```

**Note: However, there's a small issue. The kwargs dictionary is local to the show_info function, so you can't access it outside the function.**

To fix this, you can return the kwargs dictionary from the function and store it in a variable:

```
def show_info(**kwargs):
    print(type(kwargs))
    for key, value in kwargs.items():
        print(f"{key}:{value}")
    return kwargs

kwargs_dict = show_info(Name="john", Age=24, place="london")
print("Name is ", kwargs_dict['Name'])
```


Extra Practice:

```
# Practice -1
def show_info(*kwarg):
    return

# Function call
show_info(first_name = "deepak",\
          last_name = "Mishra",\
          city = "Pune")
display = show_info
print(display)
```

output:
  show_info(first_name = "deepak",\
    ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^
              last_name = "Mishra",\
              ^^^^^^^^^^^^^^^^^^^^^^
              city = "Pune")
              ^^^^^^^^^^^^^^
TypeError: show_info() got an unexpected keyword argument 'first_name'


Sol: meta ai:

There are two errors in the given code:

1. *Typo in *kwarg*: In Python, the syntax for arbitrary keyword arguments is **kwargs, not *kwarg. The double asterisk ** is used to indicate that the function accepts keyword arguments.

2. Invalid function call: In the function call, there is a backslash \ at the end of each line, which is not necessary in this case. However, the main issue is that the function show_info is defined to accept arbitrary keyword arguments, but it doesn't return anything. It should return the kwargs dictionary or process it in some way.

Here's the corrected code:

```
def show_info(**kwargs):
       return kwargs

# Function call
info = show_info(first_name="Deepak", last_name="Mishra", city="Pune")
print(info)
```

Output:

{'first_name': 'Deepak', 'last_name': 'Mishra', 'city': 'Pune'}

  


Here are a few alternatives:

- "The default value of a parameter in a Python function is overridden when a value is explicitly passed
   for that parameter in the function call."
- "In Python, passing a value for a parameter in a function call supersedes its default value."
- "When a value is provided for a parameter in a Python function call, it takes precedence over the
    parameter's default value."
- "Python function parameters with default values are overridden by explicit values passed in the function call."
- "In Python, default parameter values are eclipsed by user-provided values in function calls."

These revised sentences aim to improve clarity, precision, and readability.

```
# practice -2
def show_info(**kwarg):
    return kwarg    

# Function call
display = show_info(first_name = "deepak", \
          last_name = "Mishra",\
          city = "Pune")

# display = show_info # this is a wrong syntax, uncomment it and run it

print(display)

print(type(display))
```


```
 # practice - 3
def show_info(**kwargs):
    return kwargs

display = show_info(first_name="Deepak",middle_name="ranjan", last_name="Mishra", city="Pune")

first_name = display['first_name']
middle_name = display['middle_name']
last_name = display['last_name']
city = display['city']

print(f"My name is {first_name} {middle_name} {last_name} and I live in {city}.")
```

Changes made:

1. Defined the show_info function to accept arbitrary keyword arguments (**kwargs) and return the kwargs dictionary.
3. Extracted the values from the display dictionary using the corresponding keys.
4. Used f-string formatting to print the desired string with the extracted values.

Now, the code should print:

My name is Deepak ranjan  Mishra and I live in Pune.




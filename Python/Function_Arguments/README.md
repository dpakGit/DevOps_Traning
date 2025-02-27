## Python Function Arguments

Reference Links : 

1. https://www.w3schools.com/python/python_functions.asp#gsc.tab=0

2. https://www.geeksforgeeks.org/python-functions/?ref=header_ind

3. https://www.tutorialspoint.com/python/python_keyword_arguments.htm

4. https://www.programiz.com/python-programming/function-argument  



# Python Function Arguments
- Date 24.2.2025

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

# https://www.tutorialspoint.com/python/python_default_arguments.htm

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
  are provided arbitarily and not sequentially
print("3: ",simple_interest)

simple_interest = si(p =1000,t = 5, r = 15) # Value of rate is changed to see if the previous value is overridden
print("4: ",simple_interest)

simple_interest = si(r = 15, t = 5,p = 1000) # all values provided using keyword argument
print("5: ",simple_interest)
```











Here are a few alternatives:

- "The default value of a parameter in a Python function is overridden when a value is explicitly passed
   for that parameter in the function call."
- "In Python, passing a value for a parameter in a function call supersedes its default value."
- "When a value is provided for a parameter in a Python function call, it takes precedence over the
    parameter's default value."
- "Python function parameters with default values are overridden by explicit values passed in the function call."
- "In Python, default parameter values are eclipsed by user-provided values in function calls."

These revised sentences aim to improve clarity, precision, and readability.

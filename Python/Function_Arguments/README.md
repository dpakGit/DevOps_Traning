## Python Function Arguments

Reference Links : 

1. https://www.w3schools.com/python/python_functions.asp#gsc.tab=0

2. https://www.geeksforgeeks.org/python-functions/?ref=header_ind

3. https://www.tutorialspoint.com/python/python_keyword_arguments.htm

4. https://www.programiz.com/python-programming/function-argument  


## Default Argument

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

**Note:** In a function header, any parameter cannot have a default value unless all parameters appearing on its right have their default values


### Invalid Function call using or Invalid defaul value assignment

```
# Ex: 1
def si(principal =,time = 5,rate):
     return (principal * time * rate)/100
  
#Ex : 2
def si(principal = 100,time,rate = 10):
     return (principal * time * rate)/100
```
  

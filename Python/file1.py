# a=2
# a=3
# a=4
# print(a)
# a=5
# print(a+a)
# # # 
# # Option 1
# # The print function always outputs the most recently assigned value of a variable, even if the variable has been assigned multiple values previously.

# # Option 2
# # When a variable is assigned multiple values, the print function will display the last value assigned to that variable.

# # Option 3
# #  In the event of multiple assignments to the same variable, the print function will always print the current or last assigned value.

#Ex - 2

# a=apple
# print(a)
# The above will give NameError

# Modified Code

# apple = 20
# a = apple
# print(a) # output gives 20

# x=10
# print(x+1) # Output will give 11

# Ex: -

# p,q,r = 5
# print(p,q,r) # Incorrect syntax

# Correct syntax

# p = q = r = 5
# print(p, q, r)  # Output: 5 5 5

# p, q, r = 5, 6, 7
# print(p, q, r)  # Output: 5 6 7

# Type Casting a Variable

# Casting variables

# s = "10"  # Initially a string as it is in double quotes
# n = int(s)  # Cast string to integer

# int = 5
# f = float(int)  # Cast integer to float

# age = 25
# st = str(age)  # Cast integer to string

# # Display results
# print(n)  
# print(f)  
# print(st)

# Getting the Type of Variable

# Define variables with different data types

# n = 42
# f = 3.14
# s = "Hello, World!"
# li = [1, 2, 3]
# d = {'key': 'value'}
# bool = True

# Get and print the type of each variable

# print(type(n))  
# print(type(f))
# print(type(s))
# print(type(li))
# print(type(d))
# print(type(bool))



MyName = "python-1" # Pascal case

myName = "python-2" # Camel case

myname = "python-3" # Flat case

my_Name = "python-4" # Snake case


print(MyName)
print(myName)
print(myname)
print(my_Name)
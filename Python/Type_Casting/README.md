# Type Casting in Python

https://www.geeksforgeeks.org/type-casting-in-python/

https://www.w3schools.com/python/python_casting.asp

https://github.com/rishabhnmishra/python_tutorial_notes/tree/main/Chap-6%20Type%20Casting

https://medium.com/@datasciencejourney100_83560/type-casting-in-python-59902dd26bd5#:~:text=Type%20casting%2C%20also%20known%20as%20type%20conversion%2C%20is%20the%20process,you'd%20use%20type%20casting.

```
# Ex-1

a=1
b="1"
print(type(a))
print(type(b))
# print(a+b)

c=int(b) # This will convert ....
print(type(c))
print(c) # o/p=1

print(a+c) # 0/p=2

print(a+int(b))
```
```
# Ex-2
n="m"
q=int(n)
```
```
# Ex-3
MyAge1=26
print(MyAge1)
MyAge2=str(MyAge1) # str() function converts number 26 to string 26
print(type(MyAge2))
print(MyAge2)
print(MyAge1+1)
print(MyAge2+1)
```
### Convert Integer to Float
```
i=22
f=float(i)
print(i)
print(type(i))
print(f)
print(type(f))
```
### Convert Float to Integer

```
f1=66.32045678321
i=int(f1)
print(f1)
print(type(f1))
print(i)
print(type(i))
``` 
## Implicit Type Casting : 
 
### Converting integer to float
```
int = 10
float = 5.5
sum = int + float

print(sum) # output: 15.5

print(type(sum)) # output: <class 'float'>
```
## Explicit Type Casting : 

### Convertig String to number
```
str = "26"
num = int(str)
print(num)        # output: 26
print(type(num))  # output: <class 'int'>
```

## Boolean
```
b1=bool(0)
print(b1)       # output: True
print(type(b1)) # output: <class 'bool'>

b2=bool(1)
print(b2)       # output: False
print(type(b2)) # output: <class 'bool'>
```
### Converts a boolean value to an integer:

```
bool_value = True
int_value = int(bool_value)
print(int_value)  # Output: 1

bool_value = False
int_value = int(bool_value)
print(int_value)  # Output: 0
```
In Python, True is equivalent to 1 and False is equivalent to 0 when converted to integers. The int() function is used to perform this conversion.

Alternatively, you can also use a conditional expression or a ternary operator to achieve the same result:

```
bool_value = True
int_value = 1 if bool_value else 0
print(int_value)  # Output: 1
```

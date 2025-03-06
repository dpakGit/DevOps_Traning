Date : 5.3.2024

## Python String Operators

Reference links: 
1. https://realpython.com/lessons/concatenating-indexing-slicing/
2. Youtube channel of "Real Python" : https://www.youtube.com/watch?v=WGHBaMOeamQ

3. https://studyglance.in/python/string.php 

4. https://www.programiz.com/python-programming/methods/string

5. https://www.geeksforgeeks.org/python-string-methods/

6. https://www.w3schools.com/python/python_ref_string.asp

7. https://www.tutorialspoint.com/python/python_strings.htm   


### 1. Concatenation Operator :

```
string1 = "hello"
string2 = "python"
print(string1 + string2)
print(string1 + " " + string2)
```

```
first_name = "Deepak"
last_name = "Mishra"
full_name = first_name + " " + last_name
print(full_name)
```

### 2. String Repetition Operator 

The * operator, when used with strings, is called the:

String Repetition Operator

Or, more formally:

String Multiplication Operator

This operator is overloaded for strings to mean "repeat the string" rather than the traditional multiplication operation. 

In Python, the * operator is overloaded for strings to mean "repetition".

When you use the * operator with a string and an integer, it repeats the string that many times.

Here's the syntax:


string * n


Where:

- string is the string you want to repeat.
- n is the number of times you want to repeat the string.

Here are some examples:


print("Hello" * 3)  # Output: "HelloHelloHello"
print("abc" * 5)  # Output: "abcabcabcabcabc"


Note that if you try to repeat a string by a non-integer value, you'll get a TypeError:


print("Hello" * 3.5)  # TypeError: can't multiply sequence by non-int of type 'float'


Also, if you try to repeat a string by a negative integer, you'll get an empty string:


print("Hello" * -3)  # Output: ""


When you use the * operator with a string and an integer, Python repeats the entire string that many times.

For example:

```
print("Hello" * 3)
# Or
print(3 * "Hello")
```

```
3 * "ha!"
```

```
print("Hello" " " * 3) # "Hello" "space"  * 3
```

Python will repeat the entire string "Hello" three times, resulting in:

HelloHelloHello

So, the * operator essentially "stamps" the string multiple times, creating a new string with the repeated content.


```
string = "hello"

test1 = string * 2
print(test1)

test2 = string * 3
print(test2)
```

```
string = "hello"
test3 = string * 0
print(test3)
```
Output: (empty string)
In other words, the output will be an empty string.
When you multiply a string by 0, Python returns an empty string.
So, test4 will be an empty string, and print(test4) won't print anything visible.

```
string = "hello"
test4 = string * -2
print(test4)
```
Output:  the output will be an empty string, because when you multiply a string by
a negative number, Python returns an empty string.

So, test4 will be an empty string, and print(test4) won't print anything.

### 3. Slice operator : Gives the character from the given index

```
a = "hello"
print(a[0])
print(a[1])
print(a[2])
print(a[3])
print(a[4])
print(a[5]) # Output : IndexError: string index out of range
```

### 4. Range Slice - Gives the characters from the given range	

```
a = "INDIA"
b = "python"

print(a[0:5])

print(a[0:4])

print(a[1:2]) # Output : N; a[1]

print(a[2:2])

print(a[1:3])

print(a[1:4])

print(a[2:4])

print(a[3:4])

print(a[4:4])

print(a[4:3]) # Reverse
```


### 5.  "in" : It is known as membership operator.

- It returns if a particular sub-string is present in the specified string.
- Returns True or False
- It is case sensitive

```
# Ex: 1
a = "hello"
b = "Python"
print("h" in a)
print("P" in b)
```

```
# Ex: 1.1
if "P" in b:
    print("YES")
else:
    print("NO")
```

```
# Ex: 2
a = "hello"
b = "Python"
print("h" not in a)
print("P" not in b)
```

```
# Ex:2.1
if "P" not in b:
    print("YES")
else:
    print("NO")
```

### 6. Raw String

Suppresses actual meaning of Escape characters. 
The syntax for raw strings is exactly the same as for normal strings 
with the exception of the raw string operator, the letter "r," which 
precedes the quotation marks. The "r" can be lowercase (r) or uppercase (R)
 and must be placed immediately preceding the first quote mark.	
 
```
print (r'\n')

print (R'\n')


print("CakeChocolate")

print("Cake\nChocolate")

print(r"Grapes\nBanana") # prints string_1\nstring_2 as it is written,
                             # omitting the line break command \n
                        
print(R"Apple\nOrange")
```





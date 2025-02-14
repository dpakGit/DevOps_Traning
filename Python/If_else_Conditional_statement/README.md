"The else block is used to execute an alternative block of code when the conditions in an if or elif statement are not met or the condition(s) associated with an if or elif statement evaluates to False.
It provides a way to handle all other cases that are not covered by the if or elif conditions."

**Date 14.2.2025**

```
# Ex:1 # When condition is true
a=108
b=75
if a>b:
    print("a is greater than b") # When condition is true
else:
    print("a is smaller than b") # When if_condition is false
```

```
# Ex:2 # When if_condition is false

a=75
b=108
if a>b:
    print("a is greater than b") # When condition is true
else:
    print("a is smaller than b") # When if_condition is false
```

```
# Ex:3
age =15
if age >=18:
    print("Age:",age)
    print("You are eligible for voting")
else:
     print("Age:",age)
     print("You are not eligible for voting")
```

```
# EX:4
age =int(input("Enter Your Age: "))
if age >=18:
    print(age >=18)
    print("Age:",age)
    print("You are eligible for voting")
else:
     print("Age:",age)
     print("You are not eligible for voting")
```

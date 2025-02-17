**Date: 14.2.2025**

https://www.w3schools.com/python/python_conditions.asp#gsc.tab=0

https://www.geeksforgeeks.org/conditional-statements-in-python/?ref=lbp

https://www.tutorialspoint.com/python/python_if_else.htm








```
Ex: 
marks = int (input("Enter your Marks : "))

if marks >= 90:
    print("Grade : A+")
elif marks >= 80:
    print("Grade : A")
elif marks >= 70:
    print("Grade : B+")
else:
    print("Grade : C+")
```

***Here's a modified version of the code that's more concise and readable:***

```
marks = int(input("Enter your Marks: "))

if marks >= 90:
    grade = "A+"
elif marks >= 80:
    grade = "A"
elif marks >= 70:
    grade = "B+"
else:
    grade = "C+"

print(f"Grade: {grade}")
```

***Or, if you want to make it even more concise:***

```
marks = int(input("Enter your Marks: "))

grade = "A+" if marks >= 90 else "A" if marks >= 80 else "B+" if marks >= 70 else "C+"

print(f"Grade: {grade}")
```
Both versions achieve the same result, but the second one is more compact. However, the first version is more readable and easier to understand.


    

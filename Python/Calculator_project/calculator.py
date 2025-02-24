# Arithmetic Operations Functions

# Addition function
def add (num1,num2):
    return num1 + num2 

# Subtraction Function
def sub (num1,num2):
    return num1 - num2

# Multiplication Function
def multiply (num1,num2):
    return num1 * num2 

# Division Function
def division(num1,num2):
    return num1/num2

# Average Function
def avg(num1,num2):
    return (num1 + num2)/2


# Main Program

# Take input from the user

Number_1 = float(input("Enter the first number : "))

Number_2 = float(input("Enter the second number : "))

print("Please select the required operation to perform : \n " \
                  "Enter 1 for Addition ! \n " \
                  "Enter 2 for Subtraction ! \n " \
                  "Enter 3 for multiplication ! \n " \
                  "Enter 4 for Division ! \n " \
                  "Enter 5 for Average !")

# Get user's mathematical operation choice:
operation = int(input(" Type 1,2,3,4, or 5 : "))


# Perform chosen operation
if operation == 1:
    add(Number_1,Number_2)
    print("The sum of two numbers", Number_1, "and", Number_2,"is :", add(Number_1,Number_2))
    print(Number_1, "+", Number_2, "=" , add(Number_1,Number_2))
 
elif operation == 2:
    sub(Number_1,Number_2)
    print("The subtraction of two numbers", Number_1, "and", Number_2, "is : ", sub(Number_1,Number_2))
    print(Number_1, "+", Number_2, "=" , sub(Number_1,Number_2)) 

elif operation == 3:
    multiply(Number_1,Number_2)
    print("The multiplication of two numbers", Number_1, "and", Number_2, "is : ", multiply(Number_1,Number_2))

elif operation == 4:
    division(Number_1,Number_2)
    print("The division of two numbers is", Number_1, "and", Number_2, "is : ", division(Number_1,Number_2))

elif operation == 5:
    division(Number_1,Number_2)
    print("The average of two numbers is", Number_1, "and", Number_2, "is : ", avg(Number_1,Number_2))

else :
    print("Invalid Input for Operation: Please try again !")





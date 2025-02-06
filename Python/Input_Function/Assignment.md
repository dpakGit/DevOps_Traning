## Assignment Brief

**"Create a Python program that takes input for a student's name and their marks in three subjects, calculates the total percentage score, and outputs the student's name along with their total percentage score."**

```
# My code

Name = input("Student Name : - ")
sub1 = input("Marks secured in sub-1: = ")
sub2 = input("Marks secured in sub-2: = ")
sub3 = input("Marks secured in sub-3: = ")
Total_Marks = 300
Total = int(sub1) + int(sub2) + int(sub3)
percentage = (Total/Total_Marks) * 100
# print(f"Name of the student is {Name} and Percentage of marks secured by him/her is {percentage} %")

print(f"Name of the student is {Name} \nPercentage of marks secured by him/her is {percentage} %")

```


```
# Met Code -0 second method

# Take input for student's name
name = input("Enter student's name: ")

# Take input for marks in three subjects
subject1_marks = float(input("Enter marks in Subject 1: "))
subject2_marks = float(input("Enter marks in Subject 2: "))
subject3_marks = float(input("Enter marks in Subject 3: "))

# Calculate total marks
total_marks = subject1_marks + subject2_marks + subject3_marks

# Calculate total percentage score
total_percentage = (total_marks / 300) * 100

# Output student's name and total percentage score
print(f"Student Name: {name}")
print(f"Total Percentage Score: {total_percentage:.2f}%")
```

Here's how the above program works(second method):

1. The program takes input for the student's name using the input() function.

2. It then takes input for the marks in three subjects, converting the input to floating-point numbers using float().

3. The program calculates the total marks by adding the marks in all three subjects.

4. It calculates the total percentage score by dividing the total marks by the maximum possible marks (300) and multiplying by 100.

5. Finally, the program outputs the student's name and total percentage score using f-strings.

   The **:.2f format specifier** rounds the percentage score to two decimal places.

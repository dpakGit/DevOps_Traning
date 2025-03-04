Date : 4.2.2025

Reference Links:

1. https://realpython.com/python-strings/#escape-sequences-in-string-literals

2. [https://www.programiz.com/python-programming/string#:~:text=The%20escape%20sequence%20is%20used,characters%20present%20inside%20a%20string.&text=Since%20strings%20are%20represented%20by,the%20escape%20character%20%5C%20in%20Python. ](https://www.programiz.com/python-programming/string#:~:text=The%20escape%20sequence%20is%20used,characters%20present%20inside%20a%20string.&text=Since%20strings%20are%20represented%20by,the%20escape%20character%20%5C%20in%20Python.)

3. https://www.w3schools.com/python/gloss_python_escape_characters.asp

4. https://www.tutorialspoint.com/python/python_escape_characters.htm

5. https://www.geeksforgeeks.org/python-escape-characters/


Source : Meat AI

Q. Explain "Escape characters" in python ?

Sol:

In Python, escape characters are special characters that are used to represent characters that
cannot be represented directly in a string. They are called "escape" characters
because they allow you to "escape" the normal interpretation of a character.

Here are some common escape characters in Python:

1. \n: Newline character. Inserts a new line.

2. \t: Tab character. Inserts a tab.

3. \: Backslash character. Inserts a backslash.

4. ': Single quote character. Inserts a single quote.

5. ": Double quote character. Inserts a double quote.

6. \r: Carriage return character. Inserts a carriage return.

7. \b: Backspace character. Inserts a backspace.

8. \f: Form feed character. Inserts a form feed.

9. \v: Vertical tab character. Inserts a vertical tab.

10. \a: Bell character. Inserts a bell.

11. \ooo: Octal character. Inserts a character represented by an octal value.

12. \xhh: Hexadecimal character. Inserts a character represented by a hexadecimal value.

Here's an example:


print("Hello\nWorld")  # Output: Hello
                          #         World
print("Hello\tWorld")  # Output: Hello   World


In this example, the \n and \t escape characters are used to insert a newline and a tab, respectively.

Note that escape characters are only interpreted within string literals. If you try to use them outside of a string, you'll get a syntax error.




 

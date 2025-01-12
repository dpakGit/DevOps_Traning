The **Terraform console** is a command-line interface that allows you to experiment with Terraform expressions and functions.

The Terraform console allows you to experiment with different expressions and functions, including arithmetic operations, string manipulation, and more. This can be useful for testing and debugging Terraform configurations.
```
terraform console
```

#### Simple arithmetic expression

```
> 2 + 2
4

> 10-3
7

> 5*4
20

> 20/4
5
```
#### Contains() function

The contains() function in Terraform checks if a given element is present in a collection (such as a list or a set).

Here are the results:

Example 1
```
contains(tolist(["apple", "mango", "orange"]), "kiwi") 
```
returns false, because "kiwi" is not in the list.


Example 2
```
contains(tolist(["apple", "mango", "orange"]), "apple") 
```
returns true, because "apple" is in the list.

#### The length() function in Terraform returns the number of characters in a string.

The length() function in Terraform returns the number of characters in a string.
In the following example:
```
length("a,b,c")
```
,the string is "a,b,c".

So, the output of length("a,b,c") would be 5, because there are 5 characters in the string:

1. a
2. ,
3. b
4. ,
5. c

> length("a,b,c")
5

#### Split() function

The split() function in Terraform splits a string into a list of substrings based on a specified separator.

Example: -1

split(",", "a,b,c") returns ["a", "b", "c"]

The string "a,b,c" is split into a list of three elements using the comma (",") as the separator.

> split(",", "a,b,c")
tolist([
  "a",
  "b",
  "c",
])

Example: -2

The split() function in Terraform splits a string into a list of substrings based on a delimiter.

In this case, the string is "a,b,c" and the delimiter is ",".

So, the output of split(",", "a,b,c") would be:


[
  "a",
  "b",
  "c"
]


Then, the length() function is applied to this list, which returns the number of elements in the list.

So, the final output of length(split(",", "a,b,c")) would be 3.


> length(split(",", "a,b,c")) 
3


#### tomap() function

The tomap() function in Terraform converts a string or a list of strings into a map.

Example: length(tomap({"key"="value"})) 

In this case, the input is {"key"="value"}, which is already a map-like object.

So, the output of tomap({"key"="value"}) would be:


{
  "key" = "value"
}


Then, the length() function is applied to this map, which returns the number of key-value pairs in the map.

So, the final output of length(tomap({"key"="value"})) would be 1.

> length(tomap({"key"="value"})) 
1

#### max() function

The max() function in Terraform returns the maximum value from a list of numbers.

Example : max(56,75,95,5)

In this case, the input is (56, 75, 95, 5).

The max() function will compare these numbers and return the largest one, which is 95.

So, the output of max(56, 75, 95, 5) is 95.

> max(56,75,95,5)
95


#### min() function

The min() function in Terraform returns the minimum value from a list of numbers.

Example :  min(56,75,95,5)

In this case, the input is (56, 75, 95, 5).

The min() function will compare these numbers and return the smallest one, which is 5.

So, the output of min(56, 75, 95, 5) is 5.

> min(56,75,95,5)
5


#### element() function

The element() function in Terraform returns a single element from a list.

Example: element(["a","b","c","d"], 0 )


The syntax is element(list, index), where:

- list is the list of elements
- index is the zero-based index of the element to return

In this case, the input is (["a", "b", "c", "d"], 0).

The element() function will return the element at index 0, which is the first element of the list, "a".

So, the output of element(["a", "b", "c", "d"], 0) is "a".


> element(["a","b","c","d"], 0 ) 
"a"

Example:

element(["a","b","c","d"], 2+1 )
The element() function in Terraform returns a single element from a list.

The syntax is element(list, index), where:

- list is the list of elements
- index is the zero-based index of the element to return

In this case, the input is (["a", "b", "c", "d"], 2+1).

First, the expression 2+1 is evaluated, resulting in 3.

Then, the element() function returns the element at index 3, which is the fourth element of the list, "d".

So, the output of element(["a", "b", "c", "d"], 2+1) is "d".

Example:

element(["a","b","c","d"], 3+1 )

The element() function in Terraform returns a single element from a list.

The syntax is element(list, index), where:

- list is the list of elements
- index is the zero-based index of the element to return

In this case, the input is (["a", "b", "c", "d"], 3+1).

First, the expression 3+1 is evaluated, resulting in 4.

Then, the element() function attempts to return the element at index 4. However, the list only has 4 elements, with indices ranging from 0 to 3.

Since index 4 is out of bounds, the element() function will return an error.

So, the output of element(["a", "b", "c", "d"], 3+1) is an error, because the index is out of range.


#### merge() function

The merge() function in Terraform combines two or more maps into a single map.

The tomap() function is used to convert a string or a list of strings into a map.

Example:  merge(tomap({"key"="value"}), tomap({"test"="abc"}))

In this case, the input is merge(tomap({"key"="value"}), tomap({"test"="abc"})).

First, the tomap() function is applied to each argument, resulting in two maps:


{
  "key" = "value"
}


and


{
  "test" = "abc"
}


Then, the merge() function combines these two maps into a single map:


{
  "key" = "value"
  "test" = "abc"
}


So, the output of merge(tomap({"key"="value"}), tomap({"test"="abc"})) is the merged map.


> merge(tomap({"key"="value"}), tomap({"test"="abc"}))
tomap({
  "key" = "value"
  "test" = "abc"
})

#### lookup() function

The lookup() function in Terraform returns the value of a given key in a map. If the key is not found, it returns a default value.

**The syntax is lookup(map, key, default_value).**

Example : lookup({a="Welcome", b="Terraform"},"a", "Please use the right key")

In this case, the input is lookup({a="Welcome", b="Terraform"},"a", "Please use the right key").

Here:

- map is {a="Welcome", b="Terraform"}
- key is "a"
- default_value is "Please use the right key"

Since the key "a" exists in the map, the lookup() function returns the corresponding value, which is "Welcome".

So, the output of lookup({a="Welcome", b="Terraform"},"a", "Please use the right key") is "Welcome".

> lookup({a="Welcome", b="Terraform"},"a", "Please use the right key")
"Welcome"

> lookup({a="Welcome", b="Terraform"},"b", "Please use the right key")
"Terraform"

> lookup({a="Welcome", b="Terraform"},"c", "Please use the right key")
"Please use the right key"


The lookup() function in Terraform returns the value of a given key in a map. If the key is not found, it returns a default value.

The syntax is lookup(map, key, default_value).

In this case, the input is lookup({a="Welcome", b="Terraform"},"c", "Please use the right key").

Here:

- map is {a="Welcome", b="Terraform"}
- key is "c"
- default_value is "Please use the right key"

Since the key "c" does not exist in the map, the lookup() function returns the default value, which is "Please use the right key".

So, the output of lookup({a="Welcome", b="Terraform"},"c", "Please use the right key") is "Please use the right key".


> lookup({a="Welcome", b="Terraform"},"0", "Please use the right key")
"Please use the right key"

> lookup({a="Welcome", b="Terraform"},"1", "Please use the right key")
"Please use the right key"
  

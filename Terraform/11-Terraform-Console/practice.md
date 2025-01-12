root@ip-172-31-23-60:/home/ubuntu# terraform console
> 2 + 2
4
> 10-3
7
> 5*4
20
> 20/4
5
> contains(tolist(["apple", "mango", "orange"]), "kiwi")
false
> contains(tolist(["apple", "mango", "orange"]), "apple")
true
> length("a,b,c")
5
> length(split(",", "a,b,c")) 
3
> split(",", "a,b,c")
tolist([
  "a",
  "b",
  "c",
])
> length(tomap({"key"="value"})) 
1
> max(56,75,95,5)
95
> min(56,75,95,5)
5
> element(["a","b","c","d"], 0 ) 
"a"
> merge(tomap({"key"="value"}), tomap({"test"="abc"}))
tomap({
  "key" = "value"
  "test" = "abc"
})
> lookup({a="Welcome", b="Terraform"},"a", "Please use the right key")
"Welcome"
> lookup({a="Welcome", b="Terraform"},"b", "Please use the right key")
"Terraform"
> lookup({a="Welcome", b="Terraform"},"c", "Please use the right key")
"Please use the right key"
> lookup({a="Welcome", b="Terraform"},"0", "Please use the right key")
"Please use the right key"
> lookup({a="Welcome", b="Terraform"},"1", "Please use the right key")
"Please use the right key"
>  


**Source : META AI**

```
[12/01, 9:32 pm] Maverick: This code is not Terraform configuration code, but rather an interactive session with the Terraform console. The Terraform console is a command-line interface that allows you to experiment with Terraform expressions and functions.

Here's a breakdown of what's happening in this session:

1. terraform console: This command starts the Terraform console.

2. 2 + 4: This is a simple arithmetic expression that adds 2 and 4. The result is 6.

3. 10 - 7: This is another arithmetic expression that subtracts 7 from 10. The result is 3.

4. 5 * 3: This is an arithmetic expression that multiplies 5 and 3. The result is 15.

5. 30 / 5: This is an arithmetic expression that divides 30 by 5. The result is 6.

The Terraform console allows you to experiment with different expressions and functions, including arithmetic operations, string manipulation, and more. This can be useful for testing and debugging Terraform configurations.
[12/01, 9:32 pm] Maverick: length("a,b,c")
[12/01, 9:32 pm] Maverick: The length() function in Terraform returns the number of characters in a string.

In this case, the string is "a,b,c".

So, the output of length("a,b,c") would be 5, because there are 5 characters in the string:

1. a
2. ,
3. b
4. ,
5. c
[12/01, 9:32 pm] Maverick: length(split(",", "a,b,c"))
[12/01, 9:32 pm] Maverick: The split() function in Terraform splits a string into a list of substrings based on a delimiter.

In this case, the string is "a,b,c" and the delimiter is ",".

So, the output of split(",", "a,b,c") would be:


[
  "a",
  "b",
  "c"
]


Then, the length() function is applied to this list, which returns the number of elements in the list.

So, the final output of length(split(",", "a,b,c")) would be 3.
[12/01, 9:32 pm] Maverick: length(tomap({"key"="value"}))
[12/01, 9:32 pm] Maverick: The tomap() function in Terraform converts a string or a list of strings into a map.

In this case, the input is {"key"="value"}, which is already a map-like object.

So, the output of tomap({"key"="value"}) would be:


{
  "key" = "value"
}


Then, the length() function is applied to this map, which returns the number of key-value pairs in the map.

So, the final output of length(tomap({"key"="value"})) would be 1.
[12/01, 9:32 pm] Maverick: max(56,75,95,5)
[12/01, 9:32 pm] Maverick: The max() function in Terraform returns the maximum value from a list of numbers.

In this case, the input is (56, 75, 95, 5).

The max() function will compare these numbers and return the largest one, which is 95.

So, the output of max(56, 75, 95, 5) is 95.
[12/01, 9:32 pm] Maverick: min(56,75,95,5)
[12/01, 9:32 pm] Maverick: The min() function in Terraform returns the minimum value from a list of numbers.

In this case, the input is (56, 75, 95, 5).

The min() function will compare these numbers and return the smallest one, which is 5.

So, the output of min(56, 75, 95, 5) is 5.
[12/01, 9:32 pm] Maverick: element(["a","b","c","d"], 0 )
[12/01, 9:32 pm] Maverick: The element() function in Terraform returns a single element from a list.

The syntax is element(list, index), where:

- list is the list of elements
- index is the zero-based index of the element to return

In this case, the input is (["a", "b", "c", "d"], 0).

The element() function will return the element at index 0, which is the first element of the list, "a".

So, the output of element(["a", "b", "c", "d"], 0) is "a".
[12/01, 9:32 pm] Maverick: element(["a","b","c","d"], 3 )
[12/01, 9:32 pm] Maverick: The element() function in Terraform returns a single element from a list.

The syntax is element(list, index), where:

- list is the list of elements
- index is the zero-based index of the element to return

In this case, the input is (["a", "b", "c", "d"], 3).

The element() function will return the element at index 3, which is the fourth element of the list, "d".

So, the output of element(["a", "b", "c", "d"], 3) is "d".
[12/01, 9:32 pm] Maverick: element(["a","b","c","d"], 3+1 )
[12/01, 9:32 pm] Maverick: The element() function in Terraform returns a single element from a list.

The syntax is element(list, index), where:

- list is the list of elements
- index is the zero-based index of the element to return

In this case, the input is (["a", "b", "c", "d"], 3+1).

First, the expression 3+1 is evaluated, resulting in 4.

Then, the element() function attempts to return the element at index 4. However, the list only has 4 elements, with indices ranging from 0 to 3.

Since index 4 is out of bounds, the element() function will return an error.

So, the output of element(["a", "b", "c", "d"], 3+1) is an error, because the index is out of range.
[12/01, 9:32 pm] Maverick: element(["a","b","c","d"], 2+1 )
[12/01, 9:32 pm] Maverick: The element() function in Terraform returns a single element from a list.

The syntax is element(list, index), where:

- list is the list of elements
- index is the zero-based index of the element to return

In this case, the input is (["a", "b", "c", "d"], 2+1).

First, the expression 2+1 is evaluated, resulting in 3.

Then, the element() function returns the element at index 3, which is the fourth element of the list, "d".

So, the output of element(["a", "b", "c", "d"], 2+1) is "d".
[12/01, 9:32 pm] Maverick: merge(tomap({"key"="value"}), tomap({"test"="abc"}))
[12/01, 9:32 pm] Maverick: The merge() function in Terraform combines two or more maps into a single map.

The tomap() function is used to convert a string or a list of strings into a map.

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
[12/01, 9:32 pm] Maverick: lookup({a="Welcome", b="Terraform"},"a", "Please use the right key")
[12/01, 9:32 pm] Maverick: The lookup() function in Terraform returns the value of a given key in a map. If the key is not found, it returns a default value.

The syntax is lookup(map, key, default_value).

In this case, the input is lookup({a="Welcome", b="Terraform"},"a", "Please use the right key").

Here:

- map is {a="Welcome", b="Terraform"}
- key is "a"
- default_value is "Please use the right key"

Since the key "a" exists in the map, the lookup() function returns the corresponding value, which is "Welcome".

So, the output of lookup({a="Welcome", b="Terraform"},"a", "Please use the right key") is "Welcome".
[12/01, 9:32 pm] Maverick: lookup({a="Welcome", b="Terraform"},"b", "Please use the right key")
[12/01, 9:32 pm] Maverick: The lookup() function in Terraform returns the value of a given key in a map. If the key is not found, it returns a default value.

The syntax is lookup(map, key, default_value).

In this case, the input is lookup({a="Welcome", b="Terraform"},"b", "Please use the right key").

Here:

- map is {a="Welcome", b="Terraform"}
- key is "b"
- default_value is "Please use the right key"

Since the key "b" exists in the map, the lookup() function returns the corresponding value, which is "Terraform".

So, the output of lookup({a="Welcome", b="Terraform"},"b", "Please use the right key") is "Terraform".
[12/01, 9:32 pm] Maverick: lookup({a="Welcome", b="Terraform"},"c", "Please use the right key")
[12/01, 9:32 pm] Maverick: The lookup() function in Terraform returns the value of a given key in a map. If the key is not found, it returns a default value.

The syntax is lookup(map, key, default_value).

In this case, the input is lookup({a="Welcome", b="Terraform"},"c", "Please use the right key").

Here:

- map is {a="Welcome", b="Terraform"}
- key is "c"
- default_value is "Please use the right key"

Since the key "c" does not exist in the map, the lookup() function returns the default value, which is "Please use the right key".

So, the output of lookup({a="Welcome", b="Terraform"},"c", "Please use the right key") is "Please use the right key".
[12/01, 9:32 pm] Maverick: lookup({a="Welcome", b="Terraform"},"0", "Please use the right key")
[12/01, 9:32 pm] Maverick: The lookup() function in Terraform returns the value of a given key in a map. If the key is not found, it returns a default value.

The syntax is lookup(map, key, default_value).

In this case, the input is lookup({a="Welcome", b="Terraform"},"0", "Please use the right key").

Here:

- map is {a="Welcome", b="Terraform"}
- key is "0"
- default_value is "Please use the right key"

Since the key "0" does not exist in the map, the lookup() function returns the default value, which is "Please use the right key".

So, the output of lookup({a="Welcome", b="Terraform"},"0", "Please use the right key") is "Please use the right key".
```

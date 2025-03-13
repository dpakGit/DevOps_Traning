**Open your github repo. Press the . key on your keyboard to open it with web vs code. Rename there. Stage and commit the changes.**


### Basic writing and formatting syntax:
https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#images

#### Supported color models:

https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#supported-color-models

#### Links:
This site was built using [GitHub Pages](https://pages.github.com/).


#### Section links:

https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#section-links

META AI:

How is it that clicking on a heading in one part of the document takes you or redirects you to another heading ?

sol: That's a clever feature!

In Markdown files, such as README.md on GitHub, this functionality is achieved using anchor links.

Here's how it works:

1. When you create a heading in Markdown, it's automatically assigned an anchor link, which is a unique identifier for that heading.
2. The anchor link is usually generated based on the heading text, with spaces replaced by hyphens and punctuation removed.
3. When you click on a heading, your browser uses the anchor link to navigate to the corresponding heading elsewhere in the document.

In Markdown, you can also manually create anchor links using the following syntax:

```
[Link Text](#anchor-link)
```
Replace Link Text with the text you want to display, and #anchor-link with the actual anchor link (e.g., #heading-1).

By using anchor links, you can create a table of contents or cross-reference headings within your document, making it easier for readers to navigate.

GitHub and other Markdown renderers automatically generate anchor links for headings, making it easy to create clickable links between headings.

### Custom anchors:

[Custom anchors](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#custom-anchors)

<aname="unique-anchor-name"></a>

#### Q. How to rename a directory/folder on GitHub website?

Sol:. Ref - https://stackoverflow.com/questions/31861651/how-to-rename-a-directory-folder-on-github-website

``````````````````````````````````````````````````````````````````````````````````
1. __Basic writing and formatting syntax__ : (GitHub Docs) : https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax
2. https://github.com/mattcone/markdown-guide/tree/master/_basic-syntax

https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/creating-and-highlighting-code-blocks

https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/about-writing-and-formatting-on-github#enabling-fixed-width-fonts-in-the-editor

How to add color to GitHub's README.md file: https://stackoverflow.com/questions/11509830/how-to-add-color-to-githubs-readme-md-file
```````````````````````````````````````````````````````````````````````````````````



# ADD COPY ICON TO A COMMAND
## ADD COPY ICON TO A COMMAND
### ADD COPY ICON TO A COMMAND

... as described in [_Modules_](/terraform/language/modules).



```
kubectl get node 
```

```shell
terraform apply -var-file="testing.tfvars"
```




```ruby
require 'redcarpet'
markdown = Redcarpet.new("Hello World!")
puts markdown.to_html
```

```html
<div class="row">
  <div class="col-md-6 col-md-offset-3">
    <h1>Hello World</h1>
  </div>
</div>
```



```
Colons can be used to align columns.

| Tables        |      Are      |  Cool |
| ------------- | :-----------: | ----: |
| col 3 is      | right-aligned | $1600 |
| col 2 is      |   centered    |   $12 |
| zebra stripes |   are neat    |    $1 |

There must be at least 3 dashes separating each header cell.
The outer pipes (|) are optional, and you don't need to make the
raw Markdown line up prettily. You can also use inline Markdown.

| Markdown | Less      | Pretty     |
| -------- | --------- | ---------- |
| _Still_  | `renders` | **nicely** |
| 1        | 2         | 3          |

```


```
<div class="row">
  <div class="col-md-6 col-md-offset-3">
    <h1>Hello World</h1>
  </div>
</div>
```

```ruby
require 'redcarpet'
markdown = Redcarpet.new("Hello World!")
puts markdown.to_html
```
2. Multiline Code Block
3. 
```In a multiline code block, a set of lines is formatted to a single block of code. To format multiple lines of code in Discord, enclose it within three backticks. For example, to make a code block containing "This is sample multiline code block", you need to type the following:```




 

##```````````````````````````````````````````````````````````````````````````



- ==This was marked (highlight)==
- ^^This was inserted (underline)^^
- ~~This was deleted (strikethrough)~~

```
<div class="row">
  <div class="col-md-6 col-md-offset-3">
    <h1>Hello World</h1>
  </div>
</div>
```

2. Multiline Code Block

```In a multiline code block, a set of lines is formatted to a single block of code. To format multiple lines of code in Discord, enclose it within three backticks(````). For example, to make a code block containing "This is sample multiline code block", you need to type the following:```

https://www.ionos.com/digitalguide/websites/web-development/markdown/#:~:text=Strikethroughs,~~This%20text%20is%20struckthrough.



#  How to underline ?


<span style="text-decoration:underline">

underline this text</span> for HTML output or 
  
$\text{\underline{This sentence underlined using \LaTeX}}$ for pdf output.

/underline

Syntax:

<ins>text</ins>

-1. <u>The basic syntax for string slicing is:</u>

-2. <ins>The basic syntax for string slicing is:

-3. <ins>The basic syntax for string slicing is:</ins>


Just use the HTML tag (recommended) or the tag inside your markdown for this.

Just use the HTML <u> tag (recommended) or the <ins> tag inside your markdown for this.

<u>this is underlined text in HTML or markdown, which accepts HTML</u>


Underline heading:

https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax

https://stackoverflow.com/questions/3003476/get-underlined-text-with-markdown


https://medium.com/analytics-vidhya/writing-github-readme-e593f278a796


### This page copied from the Terraform documentation Github page so that i can see how writing styles are written
 
 https://github.com/hashicorp/terraform/blob/main/website/docs/language/meta-arguments/count.mdx

   
---
page_title: The count Meta-Argument - Configuration Language
description: >-
  Count helps you efficiently manage nearly identical infrastructure resources
  without writing a separate block for each one.
---

# The `count` Meta-Argument 

-> **Version note:** Module support for `count` was added in Terraform 0.13, and
previous versions can only use it with resources.

-> **Note:** A given resource or module block cannot use both `count` and `for_each`.

> **Hands-on:** Try the [Manage Similar Resources With Count](/terraform/tutorials/0-13/count?utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS) tutorial.

By default, a [resource block](/terraform/language/resources/syntax) configures one real
infrastructure object. (Similarly, a
[module block](/terraform/language/modules/syntax) includes a
child module's contents into the configuration one time.)
However, sometimes you want to manage several similar objects (like a fixed
pool of compute instances) without writing a separate block for each one.
Terraform has two ways to do this:
`count` and [`for_each`](/terraform/language/meta-arguments/for_each).

If a resource or module block includes a `count` argument whose value is a whole number,
Terraform will create that many instances.

## Basic Syntax

`count` is a meta-argument defined by the Terraform language. It can be used
with modules and with every resource type.

The `count` meta-argument accepts a whole number, and creates that many
instances of the resource or module. Each instance has a distinct infrastructure object
associated with it, and each is separately created,
updated, or destroyed when the configuration is applied.

```hcl
resource "aws_instance" "server" {
  count = 4 # create four similar EC2 instances

  ami           = "ami-a1b2c3d4"
  instance_type = "t2.micro"

  tags = {
    Name = "Server ${count.index}"
  }
}
```

## The `count` Object

In blocks where `count` is set, an additional `count` object is
available in expressions, so you can modify the configuration of each instance.
This object has one attribute:

- `count.index` — The distinct index number (starting with `0`) corresponding
  to this instance.

## Using Expressions in `count`

The `count` meta-argument accepts numeric [expressions](/terraform/language/expressions).
However, unlike most arguments, the `count` value must be known
_before_ Terraform performs any remote resource actions. This means `count`
can't refer to any resource attributes that aren't known until after a
configuration is applied (such as a unique ID generated by the remote API when
an object is created).

## Referring to Instances

When `count` is set, Terraform distinguishes between the block itself
and the multiple _resource or module instances_ associated with it. Instances are
identified by an index number, starting with `0`.

- `<TYPE>.<NAME>` or `module.<NAME>` (for example, `aws_instance.server`) refers to the resource block.
- `<TYPE>.<NAME>[<INDEX>]` or `module.<NAME>[<INDEX>]` (for example, `aws_instance.server[0]`,
  `aws_instance.server[1]`, etc.) refers to individual instances.

This is different from resources and modules without `count` or `for_each`, which can be
referenced without an index or key.

Similarly, resources from child modules with multiple instances are prefixed
with `module.<NAME>[<KEY>]` when displayed in plan output and elsewhere in the UI.
For a module without `count` or `for_each`, the address will not contain
the module index as the module's name suffices to reference the module.

-> **Note:** Within nested `provisioner` or `connection` blocks, the special
`self` object refers to the current _resource instance,_ not the resource block
as a whole.

## When to Use `for_each` Instead of `count`

If your instances are almost identical, `count` is appropriate. If some
of their arguments need distinct values that can't be directly derived from an
integer, it's safer to use `for_each`.

Before `for_each` was available, it was common to derive `count` from the
length of a list and use `count.index` to look up the original list value:

```hcl
variable "subnet_ids" {
  type = list(string)
}

resource "aws_instance" "server" {
  # Create one instance for each subnet
  count = length(var.subnet_ids)

  ami           = "ami-a1b2c3d4"
  instance_type = "t2.micro"
  subnet_id     = var.subnet_ids[count.index]

  tags = {
    Name = "Server ${count.index}"
  }
}
```

This was fragile, because the resource instances were still identified by their
_index_ instead of the string values in the list. If an element was removed from
the middle of the list, every instance _after_ that element would see its
`subnet_id` value change, resulting in more remote object changes than intended.
Using `for_each` gives the same flexibility without the extra churn.



### Colour format

https://stackoverflow.com/questions/11509830/how-to-add-color-to-githubs-readme-md-file

```diff
- text in red
+ text in green
! text in orange
# text in gray
@@ text in purple (and bold)@@
```


```diff

```

```json
   // code for coloring
```

Code             	Appearing

$${\color{red}Red}$$	$${\color{red}Red}$$

$${\color{green}Green}$$	$${\color{green}Green}$$

$${\color{lightgreen}Light \space Green}$$	$${\color{lightgreen}Light \space Green}$$

$${\color{blue}Blue}$$	$${\color{blue}Blue}$$

$${\color{lightblue}Light \space Blue}$$	$${\color{lightblue}Light \space Blue}$$

$${\color{black}Black}$$	$${\color{black}Black}$$

$${\color{white}White}$$	$${\color{white}White}$$ 


More than one color

$${\color{red}Welcome \space \color{lightblue}To \space \color{orange}Stackoverflow}$$
 
To attach an icon or button to a heading in a GitHub README.md file, which redirects to another heading, you can use a combination of Markdown and HTML. Here's a step-by-step guide:

Method 1: Using Markdown
1. Create a heading with an anchor link:

## Heading 1 {#heading-1}

Note the {#heading-1} part, which creates an anchor link.

2. Create another heading with an anchor link:

## Heading 2 {#heading-2}

3. To link to Heading 2 from Heading 1, use:

[Go to Heading 2](#heading-2)

This will create a clickable link.

Method 2: Using HTML
1. Create a heading with an HTML anchor tag:

<h2 id="heading-1">Heading 1</h2>

2. Create another heading with an HTML anchor tag:

<h2 id="heading-2">Heading 2</h2>

3. To link to Heading 2 from Heading 1, use:

<a href="#heading-2">Go to Heading 2</a>

This will create a clickable link.

Adding an Icon
To add an icon to the link, you can use HTML and an icon library like Font Awesome. Here's an example:


<a href="#heading-2"><i class="fa fa-arrow-down" aria-hidden="true"></i> Go to Heading 2</a>

Replace fa fa-arrow-down with the icon class of your choice.

Make sure to include the Font Awesome CSS file in your README.md file or GitHub repository settings.

That's it! You should now have a heading with an icon or button that redirects to another heading.


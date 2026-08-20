# HTML

HTML, or Hypertext Markup Language, is the standard markup language used for creating web pages, defining the structure and layout of content on the internet. It consists of a series of elements, represented by tags, which instruct web browsers on how to display text, images, and other multimedia. HTML is not a programming language but is essential for web development, allowing developers to design how web page elements are displayed. The World Wide Web Consortium (W3C) maintains and updates HTML specifications, ensuring compatibility across different browsers. HTML documents are saved with a `.html` or `.htm` file extension and are read by web browsers to render the content as intended by the author.

HTML tags are fundamental components of web pages, used to define the structure and content of HTML elements. They are keywords enclosed in angle brackets (`<` and `>`) that instruct web browsers on how to format and display web pages.

### Structure of HTML Tags

Most HTML tags consist of two parts:

* **Opening Tag**: This begins the element, e.g., `<html>`.
* **Closing Tag**: This ends the element, e.g., `</html>`. The closing tag is the same as the opening tag but with a forward-slash (`/`) added before the tag name.

However, some HTML tags are self-closing and do not require a separate closing tag, such as the `<br/>` tag for line breaks.

### Common HTML Tags

Here are some essential HTML tags and their uses:

| Tag                                            | Description                                                                                 |
| ---------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `<html>`                                       | Defines the root of an HTML document.                                                       |
| `<head>`                                       | Contains meta-information about the document, like the title and scripts.                   |
| `<title>`                                      | Specifies the title of the HTML document, shown in the browser's title bar.                 |
| `<body>`                                       | Contains the content of the HTML document.                                                  |
| `<h1>`, `<h2>`, `<h3>`, `<h4>`, `<h5>`, `<h6>` | Defines headings of different sizes, with `<h1>` being the largest and `<h6>` the smallest. |
| `<p>`                                          | Defines a paragraph of text.                                                                |
| `<br/>`                                        | Creates a line break.                                                                       |
| `<hr>`                                         | Inserts a horizontal line.                                                                  |

### Purpose of HTML Tags

HTML tags serve several purposes:

* **Define Structure**: They organize content into logical sections like headings, paragraphs, and links.
* **Provide Meaning**: Tags convey semantic meaning to web browsers and search engines, helping them understand the content's purpose.
* **Control Appearance**: Tags can influence how content is displayed, though this is often enhanced with CSS (Cascading Style Sheets).

### HTML Attributes

In addition to tags, HTML attributes provide additional information or properties to elements. They are attached to the opening tag and modify the behavior, appearance, or properties of elements. Common attributes include `href`, `src`, `alt`, `style`, and `class`

The `<head>` tag in HTML is a container for metadata about the document, such as the title, character encoding, links to stylesheets or scripts, and other meta information. Here are some examples of how the `<head>` tag can be used:

## Using `<head>` Tag

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <title>My Web Page</title>
    <meta charset="UTF-8">
</head>
<body>
    <h1>Welcome to My Web Page</h1>
    <p>This is a basic web page.</p>
</body>
</html>
```

### Example 2: Including Styles and Scripts

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Styled Web Page</title>
    <meta charset="UTF-8">
    <style>
        body { background-color: lightblue; }
        h1 { color: white; }
    </style>
    <script src="script.js"></script>
</head>
<body>
    <h1>Styled Heading</h1>
    <p>This page has a styled background and heading.</p>
</body>
</html>
```

### Example 3: Linking External Stylesheets

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Linked Stylesheet</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Heading with Linked Styles</h1>
    <p>This page uses styles from an external stylesheet.</p>
</body>
</html>
```

### Example 4: SEO Optimization

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <title>SEO Optimized Page</title>
    <meta charset="UTF-8">
    <meta name="description" content="This page is optimized for search engines.">
    <meta name="keywords" content="SEO, optimization, web page">
    <link rel="canonical" href="https://example.com/optimized-page">
</head>
<body>
    <h1>SEO Optimized Heading</h1>
    <p>This page is optimized for better search engine rankings.</p>
</body>
</html>
```

These examples illustrate how the `<head>` tag can be used to include metadata, styles, scripts, and SEO optimizations in an HTML document.

## Using `<body>` tag

The `<body>` tag in HTML is used to define the main content of an HTML document, including text, images, links, tables, and more. Here are some examples of how the `<body>` tag can be used:

### Example 1: Basic HTML Document

```html
<!DOCTYPE html>
<html>
<head>
    <title>Basic Web Page</title>
</head>
<body>
    <h1>Welcome to My Web Page</h1>
    <p>This is the main content of my web page.</p>
</body>
</html>
```

### Example 2: Including Images

```html
<!DOCTYPE html>
<html>
<head>
    <title>Web Page with Image</title>
</head>
<body>
    <h1>Image Example</h1>
    <p>This page includes an image.</p>
    <img src="image.jpg" alt="My Image">
</body>
</html>
```

### Example 3: Using Lists and Links

```html
<!DOCTYPE html>
<html>
<head>
    <title>Web Page with Lists and Links</title>
</head>
<body>
    <h1>Lists and Links Example</h1>
    <p>This page includes lists and links.</p>
    <ul>
        <li><a href="#">Link 1</a></li>
        <li><a href="#">Link 2</a></li>
        <li><a href="#">Link n</a></li>
    </ul>
</body>
</html>
```

### Example 4: Styling with Background Color

```html
<!DOCTYPE html>
<html>
<head>
    <title>Styled Web Page</title>
</head>
<body style="background-color: lightblue;">
    <h1>Styled Heading</h1>
    <p>This page has a styled background.</p>
</body>
</html>
```

### Example 5: Including Tables

```html
<!DOCTYPE html>
<html>
<head>
    <title>Web Page with Table</title>
</head>
<body>
    <h1>Table Example</h1>
    <p>This page includes a table.</p>
    <table border="1">
        <tr>
            <th>Name</th>
            <th>Age</th>
        </tr>
        <tr>
            <td>Alice</td>
            <td>25</td>
        </tr>
        <tr>
            <td>Bob</td>
            <td>30</td>
        </tr>
    </table>
</body>
</html>
```

### Example 6: Including Video

```html
<!DOCTYPE html>
<html>
<head>
    <title>Web Page with Video</title>
</head>
<body>
    <h1>Video Example</h1>
    <p>This page includes a video.</p>
    <video width="320" height="240" controls>
        <source src="example.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>
</body>
</html>
```

These examples demonstrate how the `<body>` tag can be used to structure and display various types of content on a web page.

## Using `<img>` tag

The `<img>` tag in HTML is used to embed images into a web page. Here are some examples of how to use the `<img>` tag:

### Example 1: Basic Image Insertion

```html
<!DOCTYPE html>
<html>
<head>
    <title>Basic Image</title>
</head>
<body>
    <img src="image.jpg" alt="My Image">
</body>
</html>
```

### Example 2: Specifying Image Dimensions

```html
<!DOCTYPE html>
<html>
<head>
    <title>Image with Dimensions</title>
</head>
<body>
    <img src="image.jpg" alt="My Image" width="300" height="200">
</body>
</html>
```

### Example 3: Using an Image as a Link

```html
<!DOCTYPE html>
<html>
<head>
    <title>Clickable Image</title>
</head>
<body>
    <a href="https://example.com">
        <img src="image.jpg" alt="Link to Example" width="300" height="200">
    </a>
</body>
</html>
```

### Example 4: Animated GIF

```html
<!DOCTYPE html>
<html>
<head>
    <title>Animated GIF</title>
</head>
<body>
    <img src="animation.gif" alt="Animated Image" style="width:48px;height:48px;">
</body>
</html>
```

### Example 5: Using Absolute URL for Image Source

```html
<!DOCTYPE html>
<html>
<head>
    <title>Image from External Source</title>
</head>
<body>
    <img src="https://example.com/image.jpg" alt="External Image">
</body>
</html>
```

These examples demonstrate how to insert images, specify dimensions, use images as links, display animated GIFs, and link to external images using the `<img>` tag.

### Key Attributes:

* **src**: Specifies the URL of the image.
* **alt**: Provides alternative text if the image cannot be displayed.
* **width** and **height**: Define the size of the image.
* **style**: Can be used for additional styling, such as alignment or borders.

## Using \<p> tag

The `<p>` tag in HTML is used to define a paragraph of text. Here are some examples of how to use the `<p>` tag:

### Example 1: Basic Paragraph

```html
<!DOCTYPE html>
<html>
<head>
    <title>Basic Paragraph</title>
</head>
<body>
    <p>This is a basic paragraph in HTML.</p>
</body>
</html>
```

### Example 2: Multiple Paragraphs

```html
<!DOCTYPE html>
<html>
<head>
    <title>Multiple Paragraphs</title>
</head>
<body>
    <p>This is the first paragraph.</p>
    <p>This is the second paragraph.</p>
</body>
</html>
```

### Example 3: Using Line Breaks Within a Paragraph

```html
<!DOCTYPE html>
<html>
<head>
    <title>Line Breaks in Paragraphs</title>
</head>
<body>
    <p>This is a paragraph with a line break.<br>This text starts on a new line.</p>
</body>
</html>
```

### Example 4: Styling a Paragraph with CSS

```html
<!DOCTYPE html>
<html>
<head>
    <title>Styled Paragraph</title>
    <style>
        p {
            color: navy;
            text-align: center;
        }
    </style>
</head>
<body>
    <p>This is a styled paragraph.</p>
</body>
</html>
```

### Example 5: Including Other HTML Elements Within a Paragraph

```html
<!DOCTYPE html>
<html>
<head>
    <title>Paragraph with Other Elements</title>
</head>
<body>
    <p>This paragraph includes <strong>bold text</strong> and <em>italic text</em>.</p>
</body>
</html>
```

These examples demonstrate how to create paragraphs, use line breaks, style paragraphs with CSS, and include other HTML elements within a paragraph.

## Using Lists in HTML

HTML provides three main types of lists: **unordered lists**, **ordered lists**, and **description lists**. Each type serves a specific purpose and can be customized to suit different needs.

### 1. **Unordered Lists**

* **Tag**: `<ul>`
* **Purpose**: Used to group a set of related items in no particular order.
* **Default Marker**: Bullets (small black circles).
* **Example**:

  ```html
  <ul>
      <li>Coffee</li>
      <li>Tea</li>
      <li>Milk</li>
  </ul>
  ```

### 2. **Ordered Lists**

* **Tag**: `<ol>`
* **Purpose**: Used to group a set of related items in a specific order.
* **Default Marker**: Numbers.
* **Customizable Markers**: Can use letters or Roman numerals by specifying the `type` attribute.
* **Example**:

  ```html
  <ol>
      <li>Coffee</li>
      <li>Tea</li>
      <li>Milk</li>
  </ol>
  ```
* **Customizing Markers**:
  * **Numbers**: `type="1"` (default)
  * **Uppercase Letters**: `type="A"`
  * **Lowercase Letters**: `type="a"`
  * **Uppercase Roman Numerals**: `type="I"`
  * **Lowercase Roman Numerals**: `type="i"`

### 3. **Description Lists**

* **Tag**: `<dl>`
* **Purpose**: Used to display name/value pairs such as terms and definitions.
* **Tags**:
  * `<dt>`: Defines the term (name).
  * `<dd>`: Describes the term.
* **Example**:

  ```html
  <dl>
      <dt>Coffee</dt>
      <dd>- black hot drink</dd>
      <dt>Milk</dt>
      <dd>- white cold drink</dd>
  </dl>
  ```

### Additional Features

* **Nested Lists**: Lists can be nested inside each other to create more complex structures.
* **Customization**: Lists can be styled using CSS to change their appearance, such as marker styles or colors.

### 4. Nested Lists in HTML

Creating a nested list in HTML involves placing one list inside another. This can be done with both unordered (`<ul>`) and ordered (`<ol>`) lists. Here's how you can create nested lists:

### Steps to Create a Nested List

1. **Start with a Parent List**: Begin with either an unordered list (`<ul>`) or an ordered list (`<ol>`).
2. **Add List Items**: Use the `<li>` tag to define each item in the list.
3. **Nest Another List**: Inside one of the `<li>` tags, add another `<ul>` or `<ol>` tag to create a nested list.
4. **Add Nested List Items**: Use `<li>` tags again to define items within the nested list.

### Example of a Nested Unordered List

```html
<ul>
    <li>Coffee</li>
    <li>Tea
        <ul>
            <li>Black tea</li>
            <li>Green tea</li>
        </ul>
    </li>
    <li>Milk</li>
</ul>
```

### Example of a Nested Ordered List

```html
<ol>
    <li>Step 1
        <ol>
            <li>Sub-step 1a</li>
            <li>Sub-step 1b</li>
        </ol>
    </li>
    <li>Step 2</li>
</ol>
```

### Example of Mixing Ordered and Unordered Lists

```html
<ol>
    <li>Step 1
        <ul>
            <li>Sub-step 1a</li>
            <li>Sub-step 1b</li>
        </ul>
    </li>
    <li>Step 2</li>
</ol>
```

### Key Points

* **Nesting Depth**: While HTML allows lists to be nested to any depth, it's generally advisable to limit nesting to three levels for clarity and usability
* **CSS Styling**: You can use CSS to customize the appearance of your lists, such as changing bullet styles or colors
* **Semantic Use**: Ensure that lists are used semantically to improve accessibility and readability

### Key Differences

| List Type                | Purpose                | Default Marker | Tags Used              |
| ------------------------ | ---------------------- | -------------- | ---------------------- |
| **Unordered (`<ul>`)**   | No specific order      | Bullets        | `<ul>`, `<li>`         |
| **Ordered (`<ol>`)**     | Specific order         | Numbers        | `<ol>`, `<li>`         |
| **Description (`<dl>`)** | Terms and descriptions | None           | `<dl>`, `<dt>`, `<dd>` |

## Using `table` in HTML

Creating tables in HTML involves using several key elements to structure and display data in rows and columns. Here are some examples of how to create tables in HTML:

### Example 1: Simple Table

```html
<table>
    <tr>
        <td>Cell 1</td>
        <td>Cell 2</td>
        <td>Cell 3</td>
    </tr>
    <tr>
        <td>Cell 4</td>
        <td>Cell 5</td>
        <td>Cell 6</td>
    </tr>
</table>
```

### Example 2: Table with Headers

```html
<table>
    <tr>
        <th>Name</th>
        <th>Age</th>
        <th>City</th>
    </tr>
    <tr>
        <td>John</td>
        <td>25</td>
        <td>New York</td>
    </tr>
    <tr>
        <td>Jane</td>
        <td>30</td>
        <td>Los Angeles</td>
    </tr>
</table>
```

### Example 3: Table with Caption

```html
<table>
    <caption>Employee Information</caption>
    <tr>
        <th>Name</th>
        <th>Position</th>
        <th>Department</th>
    </tr>
    <tr>
        <td>Michael</td>
        <td>Manager</td>
        <td>Marketing</td>
    </tr>
    <tr>
        <td>Emily</td>
        <td>Analyst</td>
        <td>Finance</td>
    </tr>
</table>
```

### Example 4: Table with Spanning Cells

```html
<table>
    <tr>
        <th>Name</th>
        <th colspan="2">Contact Information</th>
    </tr>
    <tr>
        <td>David</td>
        <td>123-456-7890</td>
        <td>david@example.com</td>
    </tr>
</table>
```

### Key Elements Used in Tables:

* **`<table>`**: The main container for the table.
* **`<tr>`**: Defines a table row.
* **`<td>`**: Represents a standard table cell.
* **`<th>`**: Represents a table header cell.
* **`<caption>`**: Provides a title or description for the table.

These examples demonstrate how to create basic tables, add headers, include captions, and use cell spanning to manage complex layouts.

### Cell Padding and Cell Spacing

In HTML5, the `cellpadding` and `cellspacing` attributes are not supported. Instead, you can use CSS to achieve similar effects.

```html
<style>
    table {
        border-collapse: separate;
        border-spacing: 10px; /* Cell spacing */
    }
    th, td {
        padding: 10px; /* Cell padding */
        border: 1px solid black;
    }
</style>

<table>
    <tr>
        <th>Name</th>
        <th>Age</th>
    </tr>
    <tr>
        <td>John</td>
        <td>25</td>
    </tr>
    <tr>
        <td>Jane</td>
        <td>30</td>
    </tr>
</table>
```

### Rowspan

```html
<table>
    <tr>
        <th>Month</th>
        <th>Savings</th>
        <th>Savings for Holiday</th>
    </tr>
    <tr>
        <td>January</td>
        <td>$100</td>
        <td rowspan="2">$50</td>
    </tr>
    <tr>
        <td>February</td>
        <td>$80</td>
    </tr>
</table>
```

### Colspan

```html
<table>
    <tr>
        <th colspan="2">Monthly Savings</th>
    </tr>
    <tr>
        <td>January</td>
        <td>$100</td>
    </tr>
    <tr>
        <td>February</td>
        <td>$80</td>
    </tr>
</table>
```

### Combining Rowspan and Colspan

```html
<table>
    <tr>
        <th>Month</th>
        <th colspan="2">Savings Details</th>
    </tr>
    <tr>
        <td>January</td>
        <td>$100</td>
        <td>$50</td>
    </tr>
    <tr>
        <td>February</td>
        <td>$80</td>
        <td rowspan="2">$30</td>
    </tr>
    <tr>
        <td>March</td>
        <td>$90</td>
    </tr>
</table>
```

### Key Points:

* **Cell Padding**: The space between the cell border and its content. Use CSS `padding` for this.
* **Cell Spacing**: The space between cells. Use CSS `border-spacing` for this.
* **Rowspan**: Specifies the number of rows a cell should span.
* **Colspan**: Specifies the number of columns a cell should span.

## Using `<div>` in HTML

The `<div>` tag in HTML is a versatile element used to group and structure content on a web page. It is often used as a container for other HTML elements and can be styled with CSS to achieve various layouts and designs. Here are some examples of using the `<div>` tag:

### Example 1: Basic Layout Division

```html
<!DOCTYPE html>
<html>
<head>
    <title>Basic Layout</title>
    <style>
        .header { background-color: lightblue; padding: 10px; text-align: center; }
        .content { background-color: lightgrey; padding: 20px; }
        .footer { background-color: lightgreen; padding: 10px; text-align: center; }
    </style>
</head>
<body>
    <div class="header">Header</div>
    <div class="content">Main content goes here.</div>
    <div class="footer">Footer</div>
</body>
</html>
```

### Example 2: Image Gallery

```html
<!DOCTYPE html>
<html>
<head>
    <title>Image Gallery</title>
    <style>
        .gallery { display: flex; }
        .gallery img { margin: 5px; }
    </style>
</head>
<body>
    <div class="gallery">
        <img src="image1.jpg" alt="Image 1">
        <img src="image2.jpg" alt="Image 2">
        <img src="image3.jpg" alt="Image 3">
    </div>
</body>
</html>
```

### Example 3: Styling with CSS

```html
<!DOCTYPE html>
<html>
<head>
    <title>Styled Div</title>
    <style>
        .myDiv {
            border: 5px outset red;
            background-color: lightblue;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="myDiv">
        <h2>This is a heading in a div element</h2>
        <p>This is some text in a div element.</p>
    </div>
</body>
</html>
```

### Example 4: Nested Divs

```html
<!DOCTYPE html>
<html>
<head>
    <title>Nested Divs</title>
    <style>
        div {
            border: 2px solid black;
            padding: 4px;
        }
    </style>
</head>
<body>
    <div>Outer
        <div>Inner
            <div>Inner1</div>
        </div>
    </div>
</body>
</html>
```

### Example 5: Creating a Form Inside a Div

```html
<!DOCTYPE html>
<html>
<head>
    <title>Form Inside Div</title>
    <style>
        .myForm {
            width: 300px;
            height: 250px;
            background-color: green;
            border-radius: 10px;
        }
        .myForm h2 {
            text-align: center;
            position: relative;
            top: 10px;
            color: white;
            font-family: sans-serif;
        }
        .myForm .fields input {
            position: relative;
            top: 20px;
            border-radius: 5px;
            width: 80%;
            margin: 20px auto;
            display: flex;
            padding: 10px;
        }
        .myForm button {
            width: 100px;
            position: relative;
            top: 10px;
            left: 20px;
            padding: 10px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <h3>Form Inside Div</h3>
    <div class="myForm">
        <h2>Login</h2>
        <form>
            <div class="fields">
                <input type="text" placeholder="Username">
                <input type="password" placeholder="password">
                <br>
                <button>Login</button>
            </div>
        </form>
    </div>
</body>
</html>
```

These examples demonstrate how the `<div>` tag can be used to structure content, create layouts, and apply styles using CSS.

## Creating Forms in HTML

HTML forms are used to collect user input and send it to a server for processing. Here are some examples of using forms in HTML:

### Example 1: Basic Form with Text Inputs

```html
<form action="/action_page.php">
    <label for="fname">First name:</label><br>
    <input type="text" id="fname" name="fname" value="John"><br>
    <label for="lname">Last name:</label><br>
    <input type="text" id="lname" name="lname" value="Doe"><br><br>
    <input type="submit" value="Submit">
</form>
```

### Example 2: Form with Checkboxes

```html
<form>
    <input type="checkbox" id="vehicle1" name="vehicle1" value="Bike">
    <label for="vehicle1"> I have a bike</label><br>
    <input type="checkbox" id="vehicle2" name="vehicle2" value="Car">
    <label for="vehicle2"> I have a car</label><br>
    <input type="checkbox" id="vehicle3" name="vehicle3" value="Boat">
    <label for="vehicle3"> I have a boat</label>
</form>
```

### Example 3: Form with Radio Buttons

```html
<form>
    <input type="radio" id="male" name="gender" value="male">
    <label for="male">Male</label><br>
    <input type="radio" id="female" name="gender" value="female">
    <label for="female">Female</label><br>
    <input type="radio" id="other" name="gender" value="other">
    <label for="other">Other</label>
</form>
```

### Example 4: Form with Select Options

```html
<form>
    <label for="cars">Choose a car:</label>
    <select id="cars" name="cars">
        <option value="volvo">Volvo</option>
        <option value="saab">Saab</option>
        <option value="mercedes">Mercedes</option>
        <option value="audi">Audi</option>
    </select>
</form>
```

### Example 5: Form with Textarea and Submit Button

```html
<form>
    <label for="message">Message:</label><br>
    <textarea id="message" name="message" rows="4" cols="50"></textarea><br>
    <input type="submit" value="Submit">
</form>
```

### Example 6: Form with Fieldset and Legend

```html
<form>
    <fieldset>
        <legend>Personalia:</legend>
        <label for="fname">First name:</label><br>
        <input type="text" id="fname" name="fname" value="John"><br>
        <label for="lname">Last name:</label><br>
        <input type="text" id="lname" name="lname" value="Doe"><br><br>
        <input type="submit" value="Submit">
    </fieldset>
</form>
```

### Key Elements Used in Forms:

* **`<form>`**: The main container for the form.
* **`<input>`**: Defines an input control (e.g., text, checkbox, radio).
* **`<textarea>`**: Defines a multi-line input control.
* **`<label>`**: Creates a caption for input elements.
* **`<select>` & `<option>`**: Create a drop-down menu with various options.
* **`<fieldset>` & `<legend>`**: Group related elements and provide a caption.

These examples demonstrate how to create different types of forms in HTML, including text inputs, checkboxes, radio buttons, select options, and textareas.

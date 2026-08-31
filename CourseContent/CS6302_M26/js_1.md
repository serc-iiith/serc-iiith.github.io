# Native JavaScript - Basics

JavaScript is a versatile programming language primarily used for creating dynamic and interactive features on websites. It is one of the core technologies of web development, alongside HTML and CSS, and enables developers to build modern, responsive, and user-friendly web applications.

### Key Features of JavaScript

* **Dynamic Content**: JavaScript allows websites to display timely updates, interactive maps, animations, and multimedia control. For example, features like image carousels or dropdown menus are powered by JavaScript
* **Client-Side Scripting**: It runs directly in web browsers, enabling immediate responses to user interactions without needing server communication. This reduces server load and improves performance
* **Integration with HTML and CSS**: JavaScript can manipulate and update HTML elements and CSS styles dynamically, making it integral to creating interactive web pages
* **Cross-Platform Usage**: JavaScript code can run on any machine with a compatible browser, making it platform-independent

### Applications of JavaScript

1. **Web Development**: It is used to create interactive websites that respond to user actions, such as form validation or dynamic content updates.
2. **Server-Side Development**: With tools like Node.js, JavaScript can be used for backend development to build entire applications
3. **Mobile App Development**: Frameworks like React Native enable developers to use JavaScript for building mobile applications for iOS and Android
4. **API Integration**: JavaScript interacts with APIs to fetch and display data from external services like social media platforms

### How JavaScript Works

JavaScript code is interpreted by a browser's JavaScript engine. When a webpage loads:

1. The browser creates a Document Object Model (DOM) structure.
2. The engine interprets the JavaScript code into bytecode.
3. Events like button clicks trigger the execution of code blocks that modify the DOM.
4. The browser updates the page dynamically based on these changes

### Benefits of JavaScript

* **Ease of Learning**: Its syntax is relatively simple, making it accessible for beginners.
* **Wide Support**: All major browsers support JavaScript, ensuring compatibility across platforms.
* **Rich Ecosystem**: Libraries (e.g., jQuery) and frameworks (e.g., AngularJS, React) extend its capabilities for faster development

In summary, JavaScript is essential for creating dynamic web experiences and has evolved into a powerful tool for both client-side and server-side development.

JavaScript interacts with HTML and CSS to create dynamic, interactive, and visually appealing web pages. This interaction is facilitated through the **Document Object Model (DOM)**, which represents the structure of an HTML document as a tree-like hierarchy of objects. Here's how JavaScript works with these technologies:

### Interaction with HTML

JavaScript manipulates HTML elements by accessing and modifying their properties through the DOM. It can:

* **Change Content**: JavaScript can update text or HTML within elements dynamically using methods like `innerHTML` or `textContent`
* **Add or Remove Elements**: Developers can create new elements (`document.createElement`) or remove existing ones (`element.remove()`), enabling real-time updates to the page structure[4](https://www.freecodecamp.org/news/manipulate-html-and-css-using-javascript/).
* **Event Handling**: JavaScript responds to user actions such as clicks, keypresses, or mouse movements by triggering specific functions. For example, clicking a button can display a message or modify an element's content

### Example:

```html
<h1 id="title">Welcome!</h1>
<button onclick="changeText()">Click Me</button>

<script>
function changeText() {
  document.getElementById("title").textContent = "Hello, World!";
}
</script>
```

In this example, clicking the button changes the heading text dynamically.

### Interaction with CSS

JavaScript interacts with CSS to modify styles dynamically, allowing for responsive and engaging designs. It can:

* **Change Styles**: Using `style` properties, JavaScript can directly alter CSS attributes like color, size, or visibility of elements
* **Toggle Classes**: JavaScript can add, remove, or toggle CSS classes (`element.classList`) to apply predefined styles conditionally
* **Implement Animations**: JavaScript enables dynamic animations by modifying CSS properties over time

### Example:

```html
<div id="box" style="width:100px; height:100px; background-color:blue;"></div>
<button onclick="changeColor()">Change Color</button>

<script>
function changeColor() {
  document.getElementById("box").style.backgroundColor = "red";
}
</script>
```

Here, clicking the button changes the box's background color.

### How HTML, CSS, and JavaScript Work Together

* **HTML** provides the structure (e.g., headings, paragraphs).
* **CSS** defines the visual styling (e.g., colors, fonts).
* **JavaScript** adds interactivity and functionality (e.g., responding to user actions)

### Analogy:

Think of a website as a house:

* **HTML** is the blueprint defining its layout.
* **CSS** decorates it with paint and furniture.
* **JavaScript** adds functionality like turning lights on/off or moving furniture dynamically

By combining these technologies seamlessly, developers create modern web experiences that are both functional and visually engaging.

## Alert Box

In JavaScript, an **alert box** is a simple popup dialog used to display a message to the user. It pauses the execution of code and requires the user to acknowledge the message by clicking the "OK" button before proceeding. The `alert()` method is part of the browser's `window` object and is often used for notifications, warnings, or debugging purposes.

### Key Features of `alert()`

* **Purpose**: To display a message or warning.
* **Interaction**: It interrupts user interaction with the webpage until the alert is dismissed.
* **UI**: Displays a dialog box with a single "OK" button.
* **Blocking Behavior**: Prevents access to other parts of the webpage until closed.

### Syntax

```javascript
alert("Your message here");
```

* **Parameter**: A string containing the message to be displayed.
* **Return Value**: None (the function does not return any value).

### Examples

### 1. Basic Alert

```javascript
alert("This is a basic alert!");
```

Displays a simple message in an alert box.

### 2. Alert with Line Breaks

```javascript
alert("Hello!\nWelcome to our website.");
```

The  creates line breaks in the message.

### 3. Dynamic Alert

```javascript
let userName = "John";
alert("Hello, " + userName + "! Welcome back.");
```

This example dynamically includes a variable in the alert message.

### 4. Triggering an Alert on Button Click

```html
<button onclick="showAlert()">Click Me</button>

<script>
function showAlert() {
  alert("Button clicked!");
}
</script>
```

When the button is clicked, an alert box appears with the specified message.

#### Use Cases

1. **Form Validation**: Display warnings when required fields are not filled.

   ```javascript
   if (document.getElementById("name").value === "") {
     alert("Name field cannot be empty!");
   }
   ```
2. **Error Notifications**: Inform users about errors or invalid actions.
3. **Debugging**: Temporarily display variable values or messages during development.

#### Best Practices

1. **Use Sparingly**: Overusing alerts can disrupt user experience as they block interaction with the page.
2. **Alternative Methods**: For modern applications, consider using modal dialogs or toast notifications for better UI/UX.
3. **Accessibility**: Ensure that alerts are meaningful and necessary for users.

The `alert()` method is simple yet powerful for immediate notifications but should be used judiciously to avoid frustrating users

## Prompt Box

In JavaScript, a **prompt box** is a dialog box that prompts the user to input text. It is created using the `prompt()` method, which is part of the browser's `window` object. This method is useful for gathering user input before proceeding with other actions on a webpage.

### Key Features of Prompt Box

* **User Input**: Allows users to enter text in response to a prompt.
* **Blocking Behavior**: Prevents users from interacting with the webpage until they respond by clicking either "OK" or "Cancel".
* **Return Values**: Returns the input string if "OK" is clicked, or `null` if "Cancel" is clicked.

### Syntax

```javascript
prompt(message, defaultText);
```

* **`message`**: An optional string displayed in the dialog box.
* **`defaultText`**: An optional string that pre-fills the input field.

### How Prompt Box Works

1. **Display**: The `prompt()` method displays a dialog box with a message and an input field.
2. **User Interaction**: Users can enter text and click "OK" to submit it or click "Cancel" to dismiss the dialog.
3. **Return Value**: The method returns the user's input as a string if "OK" is clicked, or `null` if "Cancel" is clicked.

### Example Usage

```javascript
let name = prompt("Please enter your name", "John Doe");
if (name !== null) {
  console.log("Hello, " + name);
} else {
  console.log("User cancelled the prompt.");
}
```

In this example, the prompt box asks for the user's name and logs a greeting if the user submits a name.

### Use Cases

1. **Simple Input**: Collecting basic user information, such as names or preferences.
2. **Debugging**: Temporarily gathering data for testing purposes.
3. **Interactive Pages**: Creating interactive experiences where user input is required.

### Best Practices

1. **Use Sparingly**: Avoid overusing prompt boxes as they can disrupt user flow.
2. **Clear Messages**: Ensure the prompt message is clear and concise.
3. **Default Values**: Provide default values when appropriate to simplify user input.

The `prompt()` method is straightforward but should be used thoughtfully to maintain a smooth user experience.

## Confirm Box

A **confirm box** in JavaScript is a dialog box used to ask users for confirmation before performing a specific action. It is created using the `confirm()` method, which displays a message along with two buttons: **OK** and **Cancel**. Depending on the user's choice, the method returns a boolean value (`true` for OK, `false` for Cancel).

### Key Features of Confirm Box

* **Purpose**: To obtain user confirmation for an action (e.g., deleting data, navigating away from a page).
* **Blocking Behavior**: It prevents interaction with the webpage until the user responds by clicking one of the buttons.
* **Return Values**:
  * `true`: If the user clicks "OK."
  * `false`: If the user clicks "Cancel" or closes the dialog box.

### Syntax

```javascript
let result = confirm("Your confirmation message here");
```

* **Parameter**: A string containing the message to display in the dialog box.
* **Return Value**: A boolean (`true` or `false`) based on user input.

### Examples

### 1. Basic Confirmation

```javascript
let userResponse = confirm("Do you want to proceed?");
if (userResponse) {
  console.log("User clicked OK.");
} else {
  console.log("User clicked Cancel.");
}
```

This example logs whether the user chose to proceed or cancel.

### 2. Confirmation Before Form Submission

```html
<form onsubmit="return confirm('Are you sure you want to submit this form?');">
  <input type="text" name="name" placeholder="Enter your name">
  <button type="submit">Submit</button>
</form>
```

Here, the form will only submit if the user clicks "OK" in the confirmation dialog.

### 3. Confirmation with Action

```javascript
function deleteItem() {
  if (confirm("Are you sure you want to delete this item?")) {
    console.log("Item deleted.");
  } else {
    console.log("Action canceled.");
  }
}
```

### Use Cases

1. **Critical Actions**: Confirming actions like deleting files, submitting forms, or navigating away from unsaved changes.
2. **User Verification**: Ensuring users intentionally perform an action.
3. **Preventing Errors**: Avoiding accidental clicks or unintended actions.

### Best Practices

1. **Use Sparingly**: Overusing confirm boxes can frustrate users and disrupt their experience.
2. **Clear Messaging**: Ensure the message is concise and clearly explains what action is being confirmed.
3. **Alternatives**: For modern applications, consider using custom modal dialogs for better design and flexibility.

### Advantages and Limitations

### Advantages:

* Simple and easy to implement.
* Built-in functionality across all browsers.

### Limitations:

* Limited styling options; appearance depends on the browser.
* Blocks interaction with the webpage until dismissed.

The `confirm()` method is a straightforward way to get user confirmation but should be used judiciously to maintain a smooth user experience

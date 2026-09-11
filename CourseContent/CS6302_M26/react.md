# ReactJS - Software System Development Lecture Notes

*Based on the Software System Development lecture materials from the International Institute of Information Technology, Hyderabad.*

## Introduction to ReactJS

React is a declarative, efficient, and flexible JavaScript library for building user interfaces. It allows developers to compose complex UIs from small and isolated pieces of code called **Components**.

### The React Paradigm

Unlike traditional JavaScript DOM manipulation where you imperatively query elements and mutate them, React abstracts this away. 

*   **Traditional DOM Manipulation:**
    ```javascript
    const element = document.querySelector();
    element.classList.add();
    element.addEventListener();
    ```
*   **The React Way:** React reacts to **State Changes**. Instead of manually updating the DOM, you update the state, and React efficiently updates the DOM to match the new state. It uses a **Virtual DOM** to figure out the minimal set of changes needed.

### Tooling and Environment Setup

*   **Node.js & npm (Node Package Manager):** Required to run JavaScript outside the browser and manage project dependencies.
    *   Command to install create-react-app globally: `~sudo npm -i -g create-react-app@1.5.2`
*   **Visual Studio Code Extensions:**
    *   *ReactSimpleSnippets* by Bruke Holland (speeds up component creation).
    *   *Prettier - Code formatter* by Esben Peterson (ensures consistent code styling).

### The React Toolchain (How it works under the hood)

React applications are typically distributed as a single JavaScript bundle that takes over a specific HTML `<div>`.

1.  **HTML Structure:**
    ```html
    <!doctype html>
    <html>
    <head>
        <title>SSD Example</title>
    </head>
    <body>
        <div id="reactapp"></div> <!-- React mounts here -->
        <script src="./webpackOutput/reactApp.bundle.js"></script>
    </body>
    </html>
    ```
2.  **JSX (JavaScript XML):** A syntax extension to JavaScript. It looks like HTML but allows you to write JavaScript expressions inside it.
3.  **Babel:** A JavaScript compiler. It takes your modern JavaScript and JSX (which browsers don't understand natively) and *transpiles* it into standard, cross-browser compatible JavaScript.
4.  **Webpack:** A module bundler. It takes all your React components, CSS, and images, and bundles them into a single output file (e.g., `reactApp.bundle.js`) that can be loaded with a single `<script>` tag.

---

## Core Concepts: Components, Props, and State

### 1. Components
Components are self-contained, reusable building blocks of a web application. Conceptually, React components are like **idempotent functions**—given the same input, they always produce the same output ($F(f(x))=f(x)$). They describe the UI at a specific point in time.

*   A class component requires a `render()` method that returns the UI.
    ```javascript
    class Tweet extends React.Component {
        state = {};
        render() {
            return (
                // JSX goes here
                <div>Tweet Content</div>
            );
        }
    }
    ```

### 2. Props (Properties)
*   Props are data passed down to a component from its **parent component**.
*   They are **read-only** (immutable) from the perspective of the receiving component.
*   Accessed via `this.props`.
    ```javascript
    // Inside a render function
    const someProp = 'bar';
    return (
        <div>
            <AnotherComponent foo={someProp} model={this.props.model} />
        </div>
    );
    ```

### 3. State
*   State represents the **internal data** of a component.
*   Unlike props, state is meant to change over time (e.g., in response to user actions or network responses).
*   Accessed via `this.state`.
*   **Crucial:** When a component's state changes (using `this.setState()`), React automatically re-invokes the `render()` method to update the UI.
    ```javascript
    render: function() {
        return (
            <h3>Click count:
                <span className='label label-default'>{this.state.clicks}</span>
            </h3>
        );
    }
    ```

---

## JSX Syntax Explained

JSX makes it easier to read and understand large UI structures compared to writing plain JavaScript rendering functions.

**Using JSX:**
```javascript
/** @jsx React.DOM */
render: function () {
    return (
        <div>
            <h2>
                <strong>Example 4:</strong> React App
            </h2>
        </div>
    );
}
```

**What it translates to (without JSX):**
```javascript
/** regular DOM */
render: function () {
    return React.DOM.div(null,
        React.DOM.h2(null, 
            React.DOM.strong(null, "Example 4:"), 
            " React App"
        )
    );
}
```

---

## The Virtual DOM

The Virtual DOM is the secret behind React's performance. Modifying the real browser DOM is slow; modifying a JavaScript object (the Virtual DOM) is fast.

1.  **State Change:** When data changes (`setState`), React creates a new Virtual DOM tree.
2.  **Diffing (Dirty Checking):** React compares the *new* Virtual DOM tree with the *previous* Virtual DOM tree to find exactly what changed.
3.  **Batch Update (Patching):** React computes a "patch" operation and updates *only* the parts of the real DOM that actually changed, rather than re-rendering the entire component or page.

---

## The React Component Lifecycle

Class components go through a series of phases. Understanding these is critical for knowing where to fetch data, set up subscriptions, or interact with the DOM.

### 1. Mounting (Creating and inserting into the DOM)
*   **`constructor`**: Initialize state and bind methods.
*   `static getDerivedStateFromProps`
*   **`render`**: The only required method. Must be pure (no side effects).
*   **`componentDidMount`**: Fired exactly once after the component is added to the DOM. *Ideal place for network requests (AJAX) or setting up subscriptions.*

### 2. Updating (Re-rendering due to changes in props or state)
Triggered by receiving new props, calling `setState()`, or `forceUpdate()`.
*   `static getDerivedStateFromProps`
*   **`shouldComponentUpdate`**: Allows you to cancel a render if you know the data hasn't changed (performance optimization). If it returns false, the update process stops here.
*   **`render`**: Re-evaluates the UI based on new state/props.
*   `getSnapshotBeforeUpdate`: Can read the DOM right before changes are committed.
*   *(React updates the DOM and refs here)*
*   **`componentDidUpdate`**: Fired after the DOM has been updated. *Good for operating on the DOM after an update or making network requests based on prop changes.*

### 3. Unmounting (Removing from the DOM)
*   **`componentWillUnmount`**: Fired right before the component is destroyed. *Crucial for cleanup (canceling network requests, removing event listeners, clearing timers) to prevent memory leaks.*

### Lifecycle Phases
*   **Render Phase:** Pure and has no side effects. Can be paused, aborted, or restarted by React. Includes `constructor`, `getDerivedStateFromProps`, `shouldComponentUpdate`, and `render`.
*   **Pre-commit Phase:** Can read the DOM (`getSnapshotBeforeUpdate`).
*   **Commit Phase:** Can work with the DOM, run side effects, and schedule updates. Includes `componentDidMount`, `componentDidUpdate`, and `componentWillUnmount`.

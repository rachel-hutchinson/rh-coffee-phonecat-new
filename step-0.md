# STEP 0

If you haven't already done so you need to install the dependencies by running:

```
npm install
```

To see the app running in a browser, open a separate terminal/command line tab or window, then run `npm start` to start the web server. Now, open a browser window for the app and navigate to `http://localhost:8000/app/`

You can now see the page in your browser. It's not very exciting, but that's OK.

The HTML page that displays `"Nothing here yet!"` was constructed with the HTML code shown below. The code contains some key Angular elements that we will need as we progress.

**app/index.html:**
```
<!doctype html>
<html lang="en" ng-app>
<head>
  <meta charset="utf-8">
  <title>My HTML File</title>
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.css">
  <link rel="stylesheet" href="css/app.css">
  <script src="bower_components/angular/angular.js"></script>
</head>
<body>

  <p>Nothing here {{'yet' + '!'}}</p>

</body>
</html>
```

### What is the code doing?

**ng-app directive:**
```
<html ng-app>
```

The `ng-app` attribute represents an Angular directive named `ngApp` (Angular uses `name-with-dashes` for its custom attributes and `camelCase` for the corresponding directives which implement them). This directive is used to flag the html element that Angular should consider to be the root element of our application. This gives application developers the freedom to tell Angular if the entire html page or only a portion of it should be treated as the Angular application.

**AngularJS script tag:**
```
<script src="bower_components/angular/angular.js">
```
This code downloads the `angular.js` script and registers a callback that will be executed by the browser when the containing HTML page is fully downloaded. When the callback is executed, Angular looks for the ngApp directive. If Angular finds the directive, it will bootstrap the application with the root of the application DOM being the element on which the ngApp directive was defined.

**Double-curly binding with an expression:**
```
Nothing here {{'yet' + '!'}}
```
This line demonstrates two core features of Angular's templating capabilities:

 - a binding, denoted by double-curlies {{ }} 
 - a simple expression `'yet' + '!'` used in this binding.

The binding tells Angular that it should evaluate an expression and insert the result into the DOM in place of the binding. Rather than a one-time insert, as we'll see in the next steps, a binding will result in efficient continuous updates whenever the result of the expression evaluation changes.

Angular expression is a JavaScript-like code snippet that is evaluated by Angular in the context of the current model scope, rather than within the scope of the global context (window).

As expected, once this template is processed by Angular, the html page contains the text: "Nothing here yet!".

### Experiments

Try adding a new expression to the index.html that will do some math:
```
<p>1 + 2 = {{ 1 + 2 }}</p>
```

## Summary

Now let's go to step 1 and add some content to the web app.
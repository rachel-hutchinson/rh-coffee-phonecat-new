# STEP 2A
New build mechanism.

This tutorial differs from that found at https://code.angularjs.org/1.2.28/docs/tutorial as it is built to demonstrate coffeescript in angular, rather than javascript. Since we now need to start adding dynamic elements to this application, we need a few more tools.

```
npm install gulp
npm install gulp-coffee gulp-concat gulp-if gulp-util del gulp-connect main-bower-files
```
`gulp` is a tool intended to 'compile' CoffeeScript into JavaScript so that the browser can interpret it and display our desired web applications.

The important new file for this step is `gulpfile.js`. Feel free to have a look, but how it works is not explicitly important in this tutorial. The important point is that the same features are available as previously described for `npm start` only this time we only need run `gulp`.

The base url for our web application is now found at `http://localhost:8000/index.html` due to this file restructure. Later on we'll learn how to change this url to say different things, including dropping the `index.html` part altogether.

# STEP 2B

Now it's time to make the web page dynamic — with AngularJS.

There are many ways to structure the code for an application. For Angular apps, we encourage the use of the Model-View-Controller (MVC) design pattern to decouple the code and to separate concerns. With that in mind, let's use a little Angular and CoffeeScript to add model, view, and controller components to our app.

 - The list of three phones is now generated dynamically from data



The most important changes are listed below.

In Angular, the view is a projection of the model through the HTML template. This means that whenever the model changes, Angular refreshes the appropriate binding points, which updates the view.

The view component is constructed by Angular from this template:

**app/index.html:**
```
<html ng-app="phonecatApp">
<head>
  ...
  <script src="bower_components/angular/angular.js"></script>
  <script src="js/controllers.js"></script>
</head>
<body ng-controller="PhoneListCtrl">

  <ul>
    <li ng-repeat="phone in phones">
      {{phone.name}}
      <p>{{phone.snippet}}</p>
    </li>
  </ul>

</body>
</html>
```
We replaced the hard-coded phone list with the `ngRepeat` directive and two Angular expressions:

The `ng-repeat="phone in phones"` attribute in the `<li>` tag is an Angular repeater directive. The repeater tells Angular to create a `<li>` element for each phone in the list using the `<li>` tag as the template.
The expressions wrapped in curly braces (`{{phone.name}}` and `{{phone.snippet}}`) will be replaced by the value of the expressions.

We have added a new directive, called `ng-controller`, which attaches a `PhoneListCtrl` controller to the `<body>` tag. At this point:

 - The expressions in curly braces (`{{phone.name}}` and `{{phone.snippet}}`) denote bindings, which are referring to our application model, which is set up in our `PhoneListCtrl` controller.

*Note: We have specified an Angular Module to load using `ng-app="phonecatApp"`, where `phonecatApp` is the name of our module. This module will contain the `PhoneListCtrl`.*

#### Model and Controller

The data model (a simple array of phones in object literal notation) is now instantiated within the `PhoneListCtrl` controller. The controller is simply a constructor function that takes a `$scope` parameter:

**app/js/controllers.js.coffee:**
```
phonecatApp = angular.module('phonecatApp', [])

phonecatApp.controller 'PhoneListCtrl', ($scope) ->
  $scope.phones = [
    {
      'name': 'Nexus S'
      'snippet': 'Fast just got faster with Nexus S.'
    }
    {
      'name': 'Motorola XOOM™ with Wi-Fi'
      'snippet': 'The Next, Next Generation tablet.'
    }
    {
      'name': 'MOTOROLA XOOM™'
      'snippet': 'The Next, Next Generation tablet.'
    }
  ]
```
Here we declared a controller called `PhoneListCtrl` and registered it in an AngularJS module, `phonecatApp`. Notice that our `ng-app` directive (on the `<html>` tag) now specifies the `phonecatApp` module name as the module to load when bootstrapping the Angular application.

Although the controller is not yet doing very much, it plays a crucial role. By providing context for our data model, the controller allows us to establish data-binding between the model and the view. We connected the dots between the presentation, data, and logic components as follows:

 - The `ngController` directive, located on the `<body>` tag, references the name of our controller, `PhoneListCtrl` (located in the JavaScript file controllers.js.coffee).

 - `The PhoneListCtrl` controller attaches the phone data to the `$scope` that was injected into our controller function. This scope is a prototypical descendant of the root scope that was created when the application was defined. This controller scope is available to all bindings located within the `<body ng-controller="PhoneListCtrl">` tag.

#### Scope

The concept of a scope in Angular is crucial. A scope can be seen as the glue which allows the template, model and controller to work together. Angular uses scopes, along with the information contained in the template, data model, and controller, to keep models and views separate, but in sync. Any changes made to the model are reflected in the view; any changes that occur in the view are reflected in the model.

To learn more about Angular scopes, see the angular scope documentation: 
https://docs.angularjs.org/guide/scope

## Summary

You now have a dynamic app that features separate model, view, and controller components. Now, let's go to step 3 to learn how to add full text search to the app.

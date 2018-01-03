# STEP 9
In this step you will learn how to create your own custom display filter.

In the previous step, the details page displayed either "true" or "false" to indicate whether certain phone features were present or not. We have used a custom filter to convert those text strings into glyphs: ✓ for "true", and ✘ for "false". Let's see what the filter code looks like.

The most important changes are listed below.

Custom Filter
In order to create a new filter, you are going to create a phonecatFilters module and register your custom filter with this module:

app/js/filters.js.coffee:

angular.module('phonecatFilters', []).filter 'checkmark', () ->
  (input) ->
    if input then '\u2713' else '\u2718'
The name of our filter is "checkmark". The input evaluates to either true or false, and we return one of the two unicode characters we have chosen to represent true (\u2713 -> ✓) or false (\u2718 -> ✘).

Now that our filter is ready, we need to register the phonecatFilters module as a dependency for our main phonecatApp module.

app/js/app.js.coffee:

...
phonecatApp = angular.module('phonecatApp', [
  'ngRoute'
  'phonecatControllers'
  'phonecatFilters'
])
...
Template
The syntax for using filters in Angular templates is as follows:

{{ expression | filter }}
Let's employ the filter in the phone details template:

app/partials/phone-detail.html:

...
<dl>
  <dt>Infrared</dt>
  <dd>{{phone.connectivity.infrared | checkmark}}</dd>
  <dt>GPS</dt>
  <dd>{{phone.connectivity.gps | checkmark}}</dd>
</dl>
...
Experiments
Let's experiment with some of the built-in Angular filters and add the following bindings to index.html:

{{ "lower cap string" | uppercase }}
{{ {foo: "bar", baz: 23} | json }}
{{ 1304375948024 | date }}
{{ 1304375948024 | date:"MM/dd/yyyy @ h:mma" }}
We can also create a model with an input element, and combine it with a filtered binding. Add the following to index.html:

<input ng-model="userInput"> Uppercased: {{ userInput | uppercase }}
Summary
Now that you have learned how to write and test a custom filter, go to step 10 to learn how we can use Angular to enhance the phone details page further.
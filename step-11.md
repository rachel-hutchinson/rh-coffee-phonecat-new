# STEP 11

In this step, you will change the way our app fetches data.

We defined a custom service that represents a RESTful client. Using this client we can make requests to the server for data in an easier way, without having to deal with the lower-level `$http` API, HTTP methods and URLs.

The most important changes are listed below.

### Dependencies

The RESTful functionality is provided by Angular in the `ngResource` module, which is distributed separately from the core Angular framework.

We are using Bower to install client side dependencies. This step updates the `bower.json` configuration file to include the new dependency:
```
{
  "name": "coffee-phonecat",
  "description": "A starter project for AngularJS - a la coffeescript",
  "version": "0.0.0",
  "homepage": "https://github.com/pshealth/coffee-phonecat",
  "license": "MIT",
  "private": true,
  "dependencies": {
    "angular": "1.2.32",
    "angular-route": "~1.2.x",
    "angular-resource": "~1.2.x",
    "jquery": ">=1.11.3",
    "bootstrap": "~3.1.1"
  }
}
```
The new dependency "angular-resource": "~1.2.x" tells bower to install a version of the angular-resource component that is compatible with version 1.2.x. We must ask bower to download and install this dependency. We can do this by running:
```
bower install
```
Warning: If a new version of Angular has been released since you last ran `bower install`, then you may have a problem with the bower install due to a conflict between the versions of `angular.js` that need to be installed. If you get this then simply delete your `app/bower_components` folder before running `bower install`.

### Service

We create our own service to provide access to the phone data on the server:

**app/js/services.js.coffee:**
```
phonecatServices = angular.module('phonecatServices', ['ngResrouce'])

phonecatServices.factory 'Phone', ($resource) ->
  $resource('phone/:phoneId.json', {}, {
    query: {
      method: 'GET'
      params: {phoneId:'phones'}
      isArray: true
    }
  })
```

We used the module API to register a custom service using a factory function. We passed in the name of the service - 'Phone' - and the factory function. The factory function is similar to a controller's constructor in that both can declare dependencies to be injected via function arguments. The Phone service declared a dependency on the `$resource` service.

The `$resource` service makes it easy to create a RESTful client with just a few lines of code. This client can then be used in our application, instead of the lower-level `$http` service.

**app/js/app.js.coffee:**
```
...
phonecatApp = angular.module('phonecatApp', [
  'ngRoute'
  'phonecatControllers'
  'phonecatFilters'
  'phonecatServices'
])
...
```

We need to add the `phonecatServices` module dependency to `phonecatApp` module's requires array.

### Controller

We simplified our sub-controllers (`PhoneListCtrl` and `PhoneDetailCtrl`) by factoring out the lower-level `$http` service, replacing it with a new service called Phone. Angular's `$resource` service is easier to use than `$http` for interacting with data sources exposed as RESTful resources. It is also easier now to understand what the code in our controllers is doing.

**app/js/controllers.js.coffee:**
```
phonecatControllers.controller 'PhoneListCtrl', ($scope, Phone) ->
  $scope.phones    = Phone.query()
  $scope.orderProp = 'age'

phonecatControllers.controller 'PhoneDetailCtrl', ($scope, $routeParams, Phone) ->
  $scope.phone = Phone.get({phoneId: $routeParams.phoneId}, (phone) ->
    $scope.mainImageUrl = phone.images[0]
  )

  $scope.setImage = (imageUrl) ->
    $scope.mainImageUrl = imageUrl

```
Notice how in `PhoneListCtrl` we replaced:
```
$http.get('phones/phones.json').then (httpresponse) ->
	$scope.phones = httpresponse.data;
```
with:
```
$scope.phones = Phone.query();
```

This is a simple statement that we want to query for all phones.

An important thing to notice in the code above is that we don't pass any callback functions when invoking methods of our Phone service. Although it looks as if the result were returned synchronously, that is not the case at all. What is returned synchronously is a "future" (think back to the concept of Promises mentioned in step 3) — an object, which will be filled with data when the XHR response returns. Because of the data-binding in Angular, we can use this future and bind it to our template. Then, when the data arrives, the view will automatically update.

Sometimes, relying on the future object and data-binding alone is not sufficient to do everything we require, so in these cases, we can add a callback to process the server response. The `PhoneDetailCtrl` controller illustrates this by setting the `mainImageUrl` in a callback.

## Summary

With the phone image swapper in place, we're all wrapped up!
It is possible to improve these elements further with animations, but we leave that as an exercise for your own time.

Head on over to step 12 for some closing comments!
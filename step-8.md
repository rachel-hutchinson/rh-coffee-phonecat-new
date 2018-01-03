# STEP 8

In this step, you will implement the phone details view, which is displayed when a user clicks on a phone in the phone list.

When you click on a phone on the list, the phone details page with phone-specific information is displayed.
To implement the phone details view we used `$http` to fetch our data, and we fleshed out the phone-`detail.html` view template.

The most important changes are listed below.

### Data

In addition to `phones.json`, the `app/phones/` directory also contains one json file for each phone:

**app/phones/nexus-s.json: (sample snippet)**
```
{
	"additionalFeatures": "Contour Display, Near Field Communications (NFC),...",
	"android": {
	    "os": "Android 2.3",
	    "ui": "Android"
	},
	...
	"images": [
	    "img/phones/nexus-s.0.jpg",
	    "img/phones/nexus-s.1.jpg",
	    "img/phones/nexus-s.2.jpg",
	    "img/phones/nexus-s.3.jpg"
	],
	"storage": {
	    "flash": "16384MB",
	    "ram": "512MB"
	}
}
```

Each of these files describes various properties of the phone using the same data structure. We'll show this data in the phone detail view.

### Controller

We'll expand the `PhoneDetailCtrl` by using the `$http` service to fetch the json files. This works the same way as the phone list controller.

**app/js/controllers.js.coffee:**
```
var phonecatControllers = angular.module('phonecatControllers',[]);

phonecatControllers.controller('PhoneDetailCtrl', ['$scope', '$routeParams', '$http',
  function($scope, $routeParams, $http) {
    $http.get('phones/' + $routeParams.phoneId + '.json').success(function(data) {
      $scope.phone = data;
    });
  }]);
```
To construct the URL for the HTTP request, we use `$routeParams.phoneId` extracted from the current route by the `$route` service.

### Template
The TBD placeholder line has been replaced with lists and bindings that comprise the phone details. Note where we use the Angular `{{expression}}` markup and `ngRepeat` to project phone data from our model into the view.

**app/partials/phone-detail.html:**
```
<img ng-src="{{phone.images[0]}}" class="phone">

<h1>{{phone.name}}</h1>

<p>{{phone.description}}</p>

<ul class="phone-thumbs">
  <li ng-repeat="img in phone.images">
    <img ng-src="{{img}}">
  </li>
</ul>

<ul class="specs">
  <li>
    <span>Availability and Networks</span>
    <dl>
      <dt>Availability</dt>
      <dd ng-repeat="availability in phone.availability">{{availability}}</dd>
    </dl>
  </li>
    ...
  <li>
    <span>Additional Features</span>
    <dd>{{phone.additionalFeatures}}</dd>
  </li>
</ul>
```

## Summary

Now that the phone details view is in place, proceed to step 9 to learn how to write your own custom display filter.
# STEP 10

In this step, you will add a clickable phone image swapper to the phone details page.

The phone details view displays one large image of the current phone and several smaller thumbnail images. It would be great if we could replace the large image with any of the thumbnails just by clicking on the desired thumbnail image. Let's have a look at how we can do this with Angular.

The most important changes are listed below

### Controller

**app/js/controllers.js.coffee:**
```
...
phonecatControllers.controller 'PhoneDetailCtrl', ($scope, $routeParams, $http) ->
  $http.get('phones/' + $routeParams.phoneId + '.json')
  .then (httpresponse) ->
      $scope.phone = httpresponse.data
      $scope.mainImageUrl = httpresponse.data.images[0]

  $scope.setImage = (imageUrl) ->
    $scope.mainImageUrl = imageUrl
```
In the `PhoneDetailCtrl` controller, we created the `mainImageUrl` model property and set its default value to the first phone image URL.

We also created a `setImage` event handler function that will change the value of `mainImageUrl`.

### Template
**app/partials/phone-detail.html:**
```
<img ng-src="{{mainImageUrl}}" class="phone">

...

<ul class="phone-thumbs">
  <li ng-repeat="img in phone.images">
    <img ng-src="{{img}}" ng-click="setImage(img)">
  </li>
</ul>
...
```
We bound the `ngSrc` directive of the large image to the `mainImageUrl` property.

We also registered an `ngClick` handler with thumbnail images. When a user clicks on one of the thumbnail images, the handler will use the `setImage` event handler function to change the value of the `mainImageUrl` property to the URL of the thumbnail image.

### Experiments

Let's add a new controller method to `PhoneDetailCtrl`:
```
$scope.hello = (name) ->
    alert('Hello ' + (name || 'world') + '!')
```
and add:
```
<button ng-click="hello('Elmo')">Hello</button>
```
to the `phone-detail.html` template.

## Summary

With the phone image swapper in place, we're ready for step 11 to learn an even better way to fetch data.
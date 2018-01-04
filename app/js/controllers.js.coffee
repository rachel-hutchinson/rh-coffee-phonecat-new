'use strict'

### Controllers ###

phonecatControllers = angular.module('phonecatControllers', [])

phonecatControllers.controller 'PhoneListCtrl', ($scope, $http) ->
  $http.get('phones/phones.json')
  .then (httpresponse) ->
    $scope.phones = httpresponse.data

  $scope.orderProp = 'age'

phonecatControllers.controller 'PhoneDetailCtrl', ($scope, $routeParams, $http) ->
  $http.get('phones/' + $routeParams.phoneId + '.json')
  .then (httpresponse) ->
      $scope.phone = httpresponse.data
      $scope.mainImageUrl = httpresponse.data.images[0]

  $scope.setImage = (imageUrl) ->
    $scope.mainImageUrl = imageUrl

  $scope.hello = (name) ->
      alert('Hello ' + (name|| 'world') + '!')

phonecatControllers.controller 'BooksCtrl', ($scope) ->
  $scope.title = 'Books'
  $scope.range = [0,1,2,3,4]
    # return new Array(n)
        
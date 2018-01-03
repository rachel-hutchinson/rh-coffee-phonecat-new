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


'use strict'

### Controllers ###

phonecatControllers = angular.module('phonecatControllers', [])

phonecatControllers.controller 'PhoneListCtrl', ($scope, $http) ->
  $http.get('phones/phones.json')
  .then (httpresponse) ->
    $scope.phones = httpresponse.data

  $scope.orderProp = 'age'

phonecatControllers.controller 'PhoneDetailCtrl', ($scope, $routeParams) ->
  $scope.phoneId = $routeParams.phoneId

  
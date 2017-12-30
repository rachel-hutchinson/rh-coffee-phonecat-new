'use strict'

### Controllers ###

phonecatApp = angular.module('phonecatApp', [])

phonecatApp.controller 'PhoneListCtrl', ($scope, $http) ->
  $http.get('phones/phones.json')
  .then (httpresponse) ->
    $scope.phones = httpresponse.data.splice(0, 5)

  $scope.orderProp = 'age'
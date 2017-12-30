'use strict'

### Controllers ###

phonecatApp = angular.module('phonecatApp', [])

phonecatApp.controller 'PhoneListCtrl', ($scope) ->
  $scope.phones = [
    {
      'name': 'Nexus S'
      'snippet': 'Fast just got faster with Nexus S.'
      'age': 1
    }
    {
      'name': 'Motorola XOOM™ with Wi-Fi'
      'snippet': 'The Next, Next Generation tablet.'
      'age': 2
    }
    {
      'name': 'MOTOROLA XOOM™'
      'snippet': 'The Next, Next Generation tablet.'
      'age': 4
    }
    {
      'name': 'iPhone'
      'snippet': 'It\'s made of apples'
      'age': 3
    }
  ]

  ### $scope.orderProp = 'age' ###
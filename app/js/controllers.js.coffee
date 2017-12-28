'use strict'

### Controllers ###

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
    {
      'name': 'iPhone 8'
      'snippet': 'A new phone.'
    }
  ]

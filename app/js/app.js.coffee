'use strict'

# App Module

phonecatApp = angular.module('phonecatApp', [
  'ngRoute'
  'phonecatControllers'
  'phonecatFilters'
])

phonecatApp.config ['$routeProvider', ($routeProvider) ->
    $routeProvider
    
    .when('/phones',
      templateUrl: 'partials/phone-list.html'
      controller: 'PhoneListCtrl'
    )

    .when('/phones/:phoneId',
      templateUrl: 'partials/phone-detail.html'
      controller: 'PhoneDetailCtrl'
    )

    .when('/books',
      templateUrl: 'partials/books.html'
      controller: 'BooksCtrl'
    )
    
    .otherwise redirectTo: '/phones'
    return
]
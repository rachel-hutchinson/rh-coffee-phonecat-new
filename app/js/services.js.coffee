'use strict'

# Services 

phonecatServices = angular.module('phonecatServices', ['ngResource'])

phonecatServices.factory 'Phone', ($resource) ->
  $resource('phones/:phoneId.json', {}, {
    query: {
      method: 'GET'
      params: {phoneId:'phones'}
      isArray: true
    }
  })
angular.module("harmanpro")
  .factory 'Venue', ['$resource', ($resource) ->
    $resource('/venues.json?locale=:locale')
  ]

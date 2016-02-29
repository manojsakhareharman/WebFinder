angular.module("harmanpro")
  .factory 'VerticalMarket', ['$resource', ($resource) ->
    $resource('/applications/:id.json?locale=:locale')
  ]

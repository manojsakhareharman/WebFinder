angular.module("harmanpro")
  .factory 'ReferenceSystem', ['$resource', ($resource) ->
    $resource('/applications/:application_id/solutions/:id.json')
  ]


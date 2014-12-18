angular.module("HarmanPro")
  .factory 'ReferenceSystem', ['$resource', ($resource) ->
    $resource('/applications/:application_id/solutions/:id.json')
  ]


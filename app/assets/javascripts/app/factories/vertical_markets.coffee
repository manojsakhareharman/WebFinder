angular.module("HarmanPro")
  .factory 'VerticalMarket', ['$resource', ($resource) ->
    $resource('/applications/:id.json')
  ]

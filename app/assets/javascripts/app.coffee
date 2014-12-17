app = angular.module 'harmanpro', [
  'ui.slider'
  'ngResource'
  'nsPopover'
]

app.factory 'ReferenceSystem', ['$resource', ($resource) ->
  $resource('/applications/:application_id/solutions/:id.json')
]

app.factory 'VerticalMarket', ['$resource', ($resource) ->
  $resource('/applications/:id.json')
]

app.controller 'VerticalMarketCtrl',
  ['$attrs', '$scope', 'VerticalMarket', ($attrs, $scope, VerticalMarket) ->
    $scope.slider_pos = 1
    $scope.systems = []

    VerticalMarket.get {
      id: $attrs.vmid
    }, (data) ->
      $scope.systems = data.vertical_market["reference_systems"]

    $scope.getCurrentSystem = ->
      if $scope.systems.length > 0
        $scope.system = $scope.systems[$scope.slider_pos - 1]

    $scope.currentSystem = ->
      if $scope.systems.length > 0
        $scope.system = $scope.systems[$scope.slider_pos - 1]

    true
  ]

app.controller 'ReferenceSystemCtrl',
  ['$attrs', '$scope', 'ReferenceSystem', ($attrs, $scope, ReferenceSystem) ->

    ReferenceSystem.get {
      application_id: $attrs.vmid
      id: $attrs.rsid
    }, (data) ->
      $scope.system = data.reference_system

    true
  ]

app.controller 'SystemDiagramCtrl',
  ['$scope', ($scope) ->
    $scope.selectedProductType = ""

    $scope.setProductType = (product_type) ->
      $scope.selectedProductType = product_type

    true
  ]

app.directive 'imgPreload', ->
  {
    restrict: 'A'
    scope: { ngSrc: '@' }
    link: (scope, element) ->
      element.on 'load', ->
        element.parent().find('span').remove()
        element.animate { opacity: 1 }
      scope.$watch 'ngSrc', ->
        element.parent().append('<span class="spinner"></span>')
        element.css { opacity: 0 }
  }

app.controller 'HomeBannerCtrl', ->
  @some_var = 1


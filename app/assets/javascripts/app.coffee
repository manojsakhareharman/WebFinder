app = angular.module('harmanpro', ['ui.slider', 'angular-images-loaded' ])

app.controller 'VerticalMarketCtrl', ['$http', '$attrs', ($http, $attrs) ->
  @slider_pos = 1
  vm = @
  vm.systems = []
  $http.get($attrs.vmurl).success (data) ->
    vm.systems = data["vertical_market"]["reference_systems"]

  @currentSystem = (slider_pos) ->
    if vm.systems.length > 0
      vm.systems[slider_pos - 1]
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

app.controller 'SystemDiagramCtrl', ->


app.controller 'HomeBannerCtrl', ->
  @some_var = 1


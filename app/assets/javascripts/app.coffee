app = angular.module 'harmanpro', [
  'ui.slider'
  'angular-images-loaded'
  'nsPopover'
]

app.controller 'VerticalMarketCtrl', ['$http', '$attrs', ($http, $attrs) ->
  vm = @
  vm.systems = []
  vm.slider_pos = 1
  vm.selectedProductType = ""

  $http.get($attrs.vmurl).success (data) ->
    vm.systems = data["vertical_market"]["reference_systems"]

  @currentSystem = ->
    slider_pos = vm.slider_pos
    if vm.systems.length > 0
      vm.systems[slider_pos - 1]

  @setProductType = (product_type) ->
    vm.selectedProductType = product_type

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

app.controller 'ReferenceSystemCtrl', ['$http', '$attrs', ($http, $attrs) ->
  rs = @
  rs.system = ""
  rs.selectedProductType = ""

  $http.get($attrs.rsurl).success (data) ->
    rs.system = data["reference_system"]

  @setProductType = (product_type) ->
    rs.selectedProductType = product_type

  true
]

app.controller 'HomeBannerCtrl', ->
  @some_var = 1


angular.module("harmanpro")
  .controller 'VerticalMarketCtrl',
    ['$attrs', '$scope', 'VerticalMarket', ($attrs, $scope, VerticalMarket) ->
      $scope.slider_pos = 1
      $scope.systems = []

      VerticalMarket.get {
        id: $attrs.vmid
      }, (data) ->
        $scope.systems = data.vertical_market["reference_systems"]

      $scope.currentSystem = ->
        if $scope.systems.length > 0
          $scope.system = $scope.systems[$scope.slider_pos - 1]

      true
    ]


angular.module("harmanpro")
  .controller 'VerticalMarketCtrl',
    ['$attrs', '$scope', 'VerticalMarket', ($attrs, $scope, VerticalMarket) ->
      $scope.slider_pos = 1
      $scope.systems = []
      $scope.system_labels = []

      VerticalMarket.get {
        id: $attrs.vmid
        locale: $attrs.locale
      }, (data) ->
        $scope.systems = data.vertical_market["reference_systems"]
        angular.forEach($scope.systems, (s) ->
          $scope.system_labels.push(s.slider_name)
        )

      $scope.currentSystem = ->
        if $scope.systems.length > 0
          $scope.system = $scope.systems[$scope.slider_pos - 1]

      true
    ]


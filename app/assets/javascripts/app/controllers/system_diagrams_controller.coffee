angular.module("harmanpro")
  .controller 'SystemDiagramCtrl',
    ['$scope', ($scope) ->
      $scope.selectedProductType = ""

      $scope.setProductType = (product_type) ->
        $scope.selectedProductType = product_type

      true
    ]


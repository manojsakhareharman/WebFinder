angular.module("harmanpro")
  .controller 'ReferenceSystemCtrl',
    ['$attrs', '$scope', 'ReferenceSystem', ($attrs, $scope, ReferenceSystem) ->

      ReferenceSystem.get {
        application_id: $attrs.vmid
        id: $attrs.rsid
      }, (data) ->
        $scope.system = data.reference_system

      true
    ]


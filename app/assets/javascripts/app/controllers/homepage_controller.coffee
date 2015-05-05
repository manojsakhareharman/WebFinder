angular.module("harmanpro")
  .controller 'HomepageBannerCtrl',
    ['$attrs', '$scope', ($attrs, $scope) ->
      $scope.venues = []

      Venue.get {}, (data) ->
        $scope.venues = data.venues

    ]

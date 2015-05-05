angular.module("harmanpro")
  .controller 'HomepageBannerCtrl',
    ['$attrs', '$scope', 'Venue', ($attrs, $scope, Venue) ->
      $scope.venues = []

      Venue.get {}, (data) ->
        $scope.venues = data.venues

    ]

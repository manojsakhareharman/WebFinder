angular.module("harmanpro")
  .controller 'HomepageBannerCtrl',
    ['$attrs', '$scope', 'Venue', ($attrs, $scope, Venue) ->
      $scope.venues = []

      Venue.get {
        locale: $attrs.locale
      }, (data) ->
        $scope.venues = data.venues

    ]

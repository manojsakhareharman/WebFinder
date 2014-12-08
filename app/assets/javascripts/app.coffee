app = angular.module('harmanpro', ['ui.slider' ])

app.controller 'VerticalMarketController', ['$http', '$attrs', ($http, $attrs) ->
  vertical_market = @
  @reference_systems = []
  @slider_pos = 1
  #@url = "/applications/#{ $attrs.vmid }.json"
  #$http.get(@url).success (data) ->
  #  vertical_market.reference_systems = data
]



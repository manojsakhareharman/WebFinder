#= require spec_helper

describe 'VerticalMarketCtrl', ->

  beforeEach ->
    @controller('VerticalMarketCtrl', {
      $scope: @scope
    })
    #@VerticalMarket = @model('VerticalMarket')

  describe 'default slider position', ->
    it 'is set to 1', ->
      expect(@scope.slider_pos).toEqual(1)

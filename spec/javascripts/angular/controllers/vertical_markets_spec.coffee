#= require spec_helper

# *******************************************
# Note for after Christmas:
#
#   It seems really difficult to test the
#   VerticalMarket controller because I wrote
#   it to pull the ID from an html attribute
#   using $attr, but that is difficult to access
#   inside the spec.
#
#   Maybe using $attr was a bad idea. Doesn't
#   seem like a lot of other examples use it.
#   Maybe I need to pass it in directly to a
#   function in the html with erb:
#
#     _instead of__
#       <... vmid="<%= @vertical_market.id %>">
#
#     _something like_
#       <... ng-something="loadVerticalMarket(<%= @vertical_market.id %>)">
#
#   It sure seems backwards, though. Assigning
#   an HTML5 data attribute seems more correct
#   to me, but it seems less-angular.
#
# ********************************************

describe 'VerticalMarketCtrl', ->
  $attrs = null

  @injected = null
  angular.module('harmanpro').controller 'fakeController', ($attrs, $element) ->
    @injected = {}
    @injected.$attrs = $attrs
    @injected.$element = $element

  beforeEach ->
    @compile('<span ng-controller="fakeController"></span>')(@scope)
    $attrs = @injected.$attrs
    @controller('VerticalMarketCtrl', {
      $scope: @scope
      $attrs: $attrs
    })
    #@VerticalMarket = @model('VerticalMarket')

  describe 'default slider position', ->
    it 'is set to 1', ->
      expect(@scope.slider_pos).toEqual(1)

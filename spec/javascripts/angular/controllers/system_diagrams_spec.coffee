#= require spec_helper

describe 'SystemDiagramCtrl', ->

  beforeEach ->
    @controller('SystemDiagramCtrl', { $scope: @scope })
    @ReferenceSystem = @model('ReferenceSystem')

    @http.flush()

  describe '$scope.setProductType', ->
    it 'stores the product type', ->
      @scope.setProductType("FOO")

      expect(@scope.selectedProductType).toEqual("FOO")

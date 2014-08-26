describe 'TableController', ->

  $rootScope = undefined
  $scope = undefined
  dessertServiceSpy = undefined
  ctrl = undefined

  beforeEach ->
    module.apply module, Dessert.Dependencies

    inject ($injector) ->
      $rootScope = $injector.get '$rootScope'
      $scope = $rootScope.$new()
      dessertServiceSpy = spyOnAngularService($injector.get('DessertService'), 'getRemotePies', {name: 'this is pie'})
      ctrl = $injector.get('$controller')('TableController', {$scope: $scope})


  describe 'Action Handlers', ->

    it 'should call DessertService.getRemotePies method', ->
      $scope.setTable()
      expect(dessertServiceSpy).toHaveBeenCalledWith()

    it 'should set the pies to the result of the service call', ->
      $scope.setTable()
      expect($scope.pies).toEqual { name: 'this is pie' }



  describe 'Getters', ->

    describe 'getSilverWare', ->

      it 'should return a fork for 0', ->
        expect($scope.getSilverWare(0)).toEqual 'Fork'

      it 'should return a spoon for 1', ->
        expect($scope.getSilverWare(1)).toEqual 'Spoon'

      it 'should return a knife for 2', ->
        expect($scope.getSilverWare(2)).toEqual 'Knife'

      it 'should return None for other', ->
        expect($scope.getSilverWare(3)).toEqual 'None'



  describe 'Initializers', ->

    it 'should initiate pies to null', ->
      expect($scope.pies).toBeNull()



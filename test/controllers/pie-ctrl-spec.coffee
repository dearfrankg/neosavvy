describe 'Pie Ctrl', ->

  $rootScope = undefined
  $scope = undefined
  ctrl = undefined
  DessertManager = undefined

  beforeEach ->
    module('pie', 'desserts')

    inject ($injector) ->
      $rootScope = $injector.get '$rootScope'
      $scope = $rootScope.$new()
      DessertManager = $injector.get 'DessertManager'
      ctrl = $injector.get('$controller')('PieCtrl', {$scope: $scope})

    $scope.$digest()


  describe 'Action Handlers', ->

    describe 'Eat Slice', ->

      it 'should decrement slices', ->
        expect($scope.slices).toEqual 8
        $scope.eatSlice()
        expect($scope.slices).toEqual 7

      it 'should do nothing when slices is 0', ->
        $scope.slices = 0
        $scope.eatSlice()
        expect($scope.slices).toEqual 0



    describe 'Toggle Mode', ->

      modeSpy = undefined

      beforeEach ->
        modeSpy = spyOn(DessertManager, 'mode').andReturn('pie')

      it 'should toggle to cake from pie', ->
        $scope.toggleMode()
        expect(modeSpy).toHaveBeenCalledWith('cake')

      it 'should toggle from pie to cake', ->
        modeSpy = modeSpy.andReturn('cake')
        $scope.toggleMode()
        expect(modeSpy).toHaveBeenCalledWith('pie')



    describe 'Request Flavor', ->

      it 'should set lastRequestedFlavor to passed in argument', ->
        ctrl.requestFlavor('cherry')
        expect($scope.lastRequestedFlavor).toEqual 'cherry'




  describe 'Initialization', ->

    it 'should initialize slices to 0', ->
      expect($scope.slices).toEqual 8

    it 'should initialize $scope.lastRequestedFlavor', ->
      expect($scope.lastRequestedFlavor).toBeUndefined()


    it 'should initialize $scope.nutritionalValue', ->
      expect($scope.nutritionalValue).toEqual {calories: 500, fat: 200, carbs: 100}

    it 'should initialize $scope.warning to null', ->
      expect($scope.warning).toBeNull()







  describe 'Listeners', ->

    describe 'pieHasBeenDepleted', ->

      it 'should set warning to RED ALERT!', ->
        $rootScope.$broadcast 'pieHasBeenDepleted'
        $scope.$digest()
        expect($scope.warning).toEqual 'RED ALERT!'

      it 'should set slices to 0', ->
        $rootScope.$broadcast 'pieHasBeenDepleted'
        $scope.$digest()
        expect($scope.slices).toEqual 0




  describe 'Watchers', ->

    it 'should warn carbs have gone up', ->
      $scope.nutritionalValue.carbs++
      $scope.$digest()
      expect($scope.warning).toEqual 'Carbs have gone up!'

    it 'should warn fat have gone up', ->
      $scope.nutritionalValue.fat++
      $scope.$digest()
      expect($scope.warning).toEqual 'Fat have gone up!'

    it 'should set warning to combo have gone up', ->
      $scope.nutritionalValue.carbs++
      $scope.nutritionalValue.fat++
      $scope.nutritionalValue.calories++
      $scope.$digest()
      expect($scope.warning).toEqual 'Calories, Fat, Carbs have gone up!'


    it 'should set warning to null when nothing goes up', ->
      expect($scope.warning).toBeNull()

    it 'should set warning to null when nothing goes up', ->
      $scope.nutritionalValue.carbs--
      $scope.nutritionalValue.fat--
      $scope.nutritionalValue.calories--
      $scope.$digest()
      expect($scope.warning).toBeNull()













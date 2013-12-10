describe 'PlaceMatController', ->

  $rootScope = undefined
  $scope = undefined
  $controller = undefined
  controller = undefined

  beforeEach ->
    module.apply module, Dessert.Dependencies

    inject ($injector) ->
      $rootScope = $injector.get '$rootScope'
      $scope = $rootScope.$new()
      $controller = $injector.get('$controller')
      parent = $controller('TableController', {$scope: $scope})
      $scope.$new()
      controller = $controller('PlaceMatController', {$scope: $scope})


  describe 'Initialization', ->

    it 'should set $scope.fork to Fork', ->
      expect($scope.fork).toEqual 'Fork'

    it 'should set $scope.spoon to Spoon', ->
      expect($scope.spoon).toEqual 'Spoon'

    it 'should set $scope.knife to Knife', ->
      expect($scope.knife).toEqual 'Knife'

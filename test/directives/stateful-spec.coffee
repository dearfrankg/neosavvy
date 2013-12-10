describe 'nsStateful', ->

  $rootScope = undefined
  $scope = undefined
  $compile = undefined
  dessertLog = undefined
  el = undefined
  $body = $('body')
  simpleHtml = '<button ns-stateful="red" ></button>'


  beforeEach ->    
    module.apply module, Dessert.Dependencies

    inject ($injector) ->
      $rootScope = $injector.get '$rootScope'
      $scope = $rootScope.$new()
      dessertLog = $injector.get 'DessertLog'
      $compile = $injector.get '$compile'
      el = $compile(angular.element(simpleHtml))($scope)

    $body.append(el)
    $rootScope.$digest()


  it 'should toggle class based on clicks', ->
    expect(el.hasClass('red')).toBeFalsy()
    el.click()
    $scope.$digest()
    expect(el.hasClass('red')).toBeTruthy()
    el.click()
    $scope.$digest()
    expect(el.hasClass('red')).toBeFalsy()
    el.click()
    $scope.$digest()
    expect(el.hasClass('red')).toBeTruthy()

  it 'should throw an error when compiled with an empty name', ->
    expect( ->
      $compile(angular.element('<a ns-stateful></a>'))($scope)
    ).toThrow()



  describe 'Methods', ->

    myScope = undefined

    beforeEach ->
      myScope = $scope.$$childHead

    describe 'logNodeBehavior', ->

      it 'should add a message to the dessertLog when called', ->
        expect(dessertLog.messages).toEqual []
        myScope.logNodeBehavior('new message')
        expect(dessertLog.messages.length).toEqual 1
        expect(dessertLog.messages).toContain 'new message'











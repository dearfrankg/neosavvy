describe 'sizeCheck', ->
  $rootScope = undefined
  $scope = undefined
  el = undefined
  $body = $('body')
  simpleHtml = '<input ng-model="amtForTrade" size-check="10" />'

  beforeEach ->
    module.apply(module, Dessert.Dependencies)

    inject ($injector, $compile) ->
      $rootScope = $injector.get '$rootScope'
      $scope = $rootScope.$new()
      el = $compile(angular.element(simpleHtml))($scope)

    $body.append(el)
    $rootScope.$digest()

  afterEach ->
    $body.empty()

  it 'should add invalid class when value > size', ->
    el.val '11'
    el.trigger 'input'
    $scope.$digest()
    expect(el.hasClass('ng-invalid')).toBeTruthy()
    expect(el.hasClass('ng-invalid-too-big')).toBeTruthy()

  it 'should add valid class when value < size', ->
    el.val '9'
    el.trigger 'input'
    $scope.$digest()
    expect(el.hasClass('ng-valid')).toBeTruthy()
    expect(el.hasClass('ng-valid-too-big')).toBeTruthy()

  it 'should be valid for a non-number', ->
    el.val 'mike'
    el.trigger 'input'
    $scope.$digest()
    expect(el.hasClass('ng-valid')).toBeTruthy()
    expect(el.hasClass('ng-valid-too-big')).toBeTruthy()

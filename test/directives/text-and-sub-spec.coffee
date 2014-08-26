describe 'nsTextAndSub', ->

  $rootScope = undefined
  $scope = undefined
  $compile = undefined
  el = undefined
  $el = undefined
  $body = $('body')
  simpleHtml = '<ns-text-and-sub text="{{scopeText}}" sub="{{scopeSub}}"></ns-text-and-sub>'


  beforeEach ->
    module('templates', 'dessert.directives')

    inject ($injector) ->
      $rootScope = $injector.get '$rootScope'
      $compile = $injector.get '$compile'
      $scope = $rootScope.$new()
      el = $compile(angular.element(simpleHtml))($scope)

    $body.append(el)
    $rootScope.$digest()

    # grab to confirm compilation
    $el = $('.text-and-sub')


  afterEach ->
    $body.empty()



  it 'should render directive in DOM', ->
    expect($el.length).toEqual(1)

  it 'should render text when given in scope', ->
    $scope.scopeText = 'foo'
    $scope.$digest()
    expect($el.find('h3').text()).toEqual 'foo'

  it 'should render sub when given in scope', ->
    $scope.scopeSub = 'bar'
    $scope.$digest()
    expect($el.find('h5').text()).toEqual 'bar'

  it 'should hide sub text when not defined', ->
    expect($el.find('h5').is(':visible')).toBeFalsy()

  it 'should show sub text is defined', ->
    $scope.scopeSub = 'bar'
    $scope.$digest()
    expect($el.find('h5').is(':visible')).toBeTruthy()

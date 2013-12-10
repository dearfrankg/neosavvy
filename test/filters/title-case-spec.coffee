describe 'titleCase', ->

  $filter = undefined
  filter = undefined

  beforeEach ->
    module 'filters'

    inject ($injector) ->
      $filter = $injector.get '$filter'  # global angular filter service
      filter = $filter 'titleCase'

  it 'should be undefined when undefined is passed in', ->
    expect(filter(undefined)).toBeUndefined()

  it 'should be null when null is passed in', ->
    expect(filter(null)).toBeNull()

  it 'should be blank when blank is passed in', ->
    expect(filter('')).toEqual('')

  it 'should change the casing of a lower cased word', ->
    expect(filter('frank gutz')).toEqual('Frank Gutz')

  it 'should change the casing of a upper cased word', ->
    expect(filter('ONE TIME')).toEqual('One Time')

  it 'should change the casing of random', ->
    expect(filter('BaNaNa BOat')).toEqual('Banana Boat')

  it 'should change the casing of a normal phrase', ->
    expect(filter('This Is Cool')).toEqual('This Is Cool')


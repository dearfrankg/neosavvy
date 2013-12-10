describe 'DessertManager', ->

  values = undefined
  factory = undefined

  beforeEach ->
    module 'desserts'

    inject ($injector) ->
      values = $injector.get 'DessertValues'
      factory = $injector.get 'DessertManager'


  describe 'DessertValues', ->

    it 'should instantiate with 3 pie flavors', ->
      expect(values.pies).toEqual([
        { flavor: 'cherry', score: 6 }
        { flavor: 'apple', score: 7.5 }
        { flavor: 'peach', score: 4 }
      ])

  describe 'DessertManager', ->

    describe 'pieFlavors', ->

    it 'should return the 3 pie flavor strings', ->
      flavors = factory.pieFlavors()
      expect(flavors.length).toEqual 3
      expect(flavors[0]).toEqual 'cherry'
      expect(flavors[1]).toEqual 'apple'
      expect(flavors[2]).toEqual 'peach'


    it 'should throw an error if there are no pies', ->
      values.pies = null
      expect( 
        -> factory.pieFlavors()
      ).toThrow()

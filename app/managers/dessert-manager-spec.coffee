
angular.module('desserts', []).value('DessertValues', {
  pies: [
    { flavor: 'cherry', score: 6 }
    { flavor: 'apple', score: 7.5 }
    { flavor: 'peach', score: 4 }
  ]
})

angular.module('desserts').factory('DessertManager', (DessertValues) ->
  return {
    pieFlavors: ->
      return DessertValues.pies.map (pie) -> pie.flavor
    mode: (mode) ->
      # not done yet
  }
)

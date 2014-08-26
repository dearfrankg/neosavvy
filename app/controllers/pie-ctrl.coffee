
angular.module('pie', []).controller 'PieCtrl', ($scope, DessertManager) ->

  # Listeners
  $scope.$on 'pieHasBeenDepleted', ->
    $scope.warning = 'RED ALERT!'
    $scope.slices = 0

  # Watchers
  compareAndWarn = (newVal, oldVal) ->
    props = []
    if newVal and oldVal
      for key of newVal
        if newVal[key] > oldVal[key]
          props.push( key.charAt(0).toUpperCase() + key.slice(1) )
    return props

  $scope.$watch('nutritionalValue', (newVal, oldVal) ->
    props = compareAndWarn(newVal, oldVal)
    if props && props.length
      $scope.warning = props.join(', ') + ' have gone up!'
    else
      $scope.warning = null
  , true)

  # Action Handlers
  $scope.eatSlice = ->
    $scope.slices-- if $scope.slices

  $scope.toggleMode = ->
    if DessertManager.mode() is 'pie'
      DessertManager.mode('cake')
    else
      DessertManager.mode('pie')

  this.requestFlavor = (flavor) ->
    $scope.lastRequestedFlavor = flavor

  $scope.slices = 8
  $scope.lastRequestedFlavor
  $scope.nutritionalValue = {calories: 500, fat: 200, carbs: 100}
  $scope.warning = null


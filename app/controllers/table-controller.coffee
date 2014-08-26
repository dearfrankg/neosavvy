Dessert.Controllers.controller 'TableController', ($scope, DessertService) ->

  $scope.setTable = ->
    DessertService.getRemotePies().then (result) ->
      $scope.pies = result

  $scope.getSilverWare = (id) ->
    return  {
      '0': 'Fork'
      '1': 'Spoon'
      '2': 'Knife'
    }[String(id)] || 'None'

  $scope.pies = null



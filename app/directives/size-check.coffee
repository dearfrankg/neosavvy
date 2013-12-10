Dessert.Directives.directive 'sizeCheck', ->

  return {
    restrict: 'A'
    scope: false
    require: 'ngModel'
    link: (scope, elem, attrs, ngModelController) ->

      ngModelController.$parsers.push (val) ->
        if parseInt(val) isnt NaN
          if parseInt(val) > parseInt(attrs.sizeCheck)
            ngModelController.$setValidity 'tooBig', false
            return undefined
          else 
            ngModelController.$setValidity 'tooBig', true
            return val
        else 
          return val
  }

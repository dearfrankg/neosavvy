Dessert.Directives.directive 'nsStateful', (DessertLog) ->

  return {
    restrict: 'A'
    scope: true
    link: (scope, elem, attrs) ->

      if not attrs.nsStateful
        throw new Error 'You must provide a class name for this directive'

      elem.bind 'click', (e) ->
        scope.$apply ->
          if not elem.hasClass attrs.nsStateful
            elem.addClass attrs.nsStateful
          else
            elem.removeClass attrs.nsStateful

      scope.logNodeBehavior = (message) ->
        DessertLog.messages.push(message)

  }

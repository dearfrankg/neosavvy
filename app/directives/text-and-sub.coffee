Dessert.Directives.directive 'nsTextAndSub', ->

  return {
    restrict: 'E'
    templateUrl: 'app/directives/text-and-sub.html'
    scope: {
      text: '@'
      sub: '@'
    }
    link: (scope, elem, attrs) ->

  }

angular.module('filters', []).filter('titleCase', ->
  return (val) ->
    if val
      return val.replace(/\w\S*/g, (txt) -> txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase() )
    else 
      return val
)
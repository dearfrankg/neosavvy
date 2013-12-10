Dessert.Services.factory 'DessertService', (nsServiceExtensions) ->

  return {

    getRemotePies: ->
      nsServiceExtensions.request
        url: 'remote/pies'
        method: 'GET'

  }
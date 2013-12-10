spyOnAngularService = (service, methodName, result) ->
  return spyOn(service, methodName).andReturn({then: (fn) ->
    fn(result)
  })

spyOnAngularServiceError = (service, methodName, result) ->
  return spyOn(service, methodName).andReturn({then: (fn, errorFn) ->
    errorFn(result)
  })

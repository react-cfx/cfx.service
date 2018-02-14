export default ({
  urlObjs
  request
}) =>
  (
    Object.keys urlObjs
  ).reduce (r, c) ->
    {
      r...
      "#{c}": (
        data
      ) =>
        urlObj = urlObjs["#{c}"]
        url =
          if data?.objectId?
          then urlObj.uri
            objectId: data.objectId
          else urlObj.uri()
        request url
        , {
          method: urlObj.method
          headers: urlObj.headers
          data
        }
    }
  , {}

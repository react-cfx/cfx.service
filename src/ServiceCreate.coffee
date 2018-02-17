export default ({
  urlObjs
  request
}) =>
  (
    Object.keys urlObjs
  ).reduce (r, c) ->
    urlObj = urlObjs["#{c}"]
    {
      r...
      "#{c}":
        if urlObj.handler?
        then urlObj.handler {
          request
          baseUrl: urlObj.baseUrl
          headers: urlObj.headers
        }
        else ( data ) =>
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

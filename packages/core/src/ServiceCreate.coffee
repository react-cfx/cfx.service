import {
  parse as urlParse
  format as urlFormat
} from 'url'
# import dd from 'ddeyes'
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
          {
            objectId
            data...
          } = data if data?.objectId?

          url =
            if objectId?
            then urlObj.uri {
              objectId
            }
            else urlObj.uri()

          if urlObj.method is 'GET'

            _urlObj = urlParse url
            if data?.token?
              {
                token
                _data...
              } = data

              url = urlFormat {
                _urlObj...
                query: _data
              }
            else
              url = urlFormat {
                _urlObj...
                query: data
              }
            
            
            reqObj = 
              method: urlObj.method
              headers: {
                urlObj.headers...
                (
                  if token?
                  then { token }
                  else {}
                )...
              }
            # dd { reqObj }
            # dd url
            # dd data

            request url
            , 
              reqObj
            
          else

            request url
            , {
              method: urlObj.method
              headers: urlObj.headers
              data
            }
    }
  , {}

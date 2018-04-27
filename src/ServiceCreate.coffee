import {
  parse as urlParse
  format as urlFormat
} from 'url'

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

            url = urlFormat {
              (urlParse url)...
              query: data
            }

            request url.toLowerCase()
            ,
              method: urlObj.method
              headers: urlObj.headers

          else

            request url.toLowerCase()
            , {
              method: urlObj.method
              headers: urlObj.headers
              data
            }
    }
  , {}

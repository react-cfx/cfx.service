# import dd from 'ddeyes'

export default ({
  name
  value
  baseUrl
  baseHeaders
}) ->

  baseUrl = "#{baseUrl}/#{name.toLowerCase()}"

  urlObj =

    switch typeof value

      when 'string'

        create:
          uri: => baseUrl
          headers: baseHeaders
          method: 'POST'

        fetch:
          uri: (data) =>
            if data?.objectId?
            then "#{baseUrl}/#{data.objectId}"
            else baseUrl
          headers: baseHeaders
          method: 'GET'

        update:
          uri: ({
            objectId
          }) => "#{baseUrl}/#{objectId}"
          headers: baseHeaders
          method: 'PUT'

        delete:
          uri: ({
            objectId
          }) => "#{baseUrl}/#{objectId}"
          headers: baseHeaders
          method: 'DELETE'

      when 'function'
        "default": {
          baseUrl
          headers: baseHeaders
          handler: value
        }

      when 'object'

        (
          Object.keys value
        )
        .reduce (r, c) =>
          {
            r...
            "#{c}":
              switch typeof value[c]
                when 'function'
                  {
                    baseUrl
                    headers: baseHeaders
                    handler: value[c]
                  }

                when 'object'
                  {
                    uri: => value[c].uri { baseUrl }
                    headers: baseHeaders
                    method: value[c].method
                  }

                else
                  {
                    baseUrl
                    headers: baseHeaders
                    handler: value[c]
                  }
          }
        , {}

      else
        "default": {
          baseUrl
          headers: baseHeaders
          method: 'GET'
        }

  "#{name}": urlObj

export default ({
  name
  value
  baseUrl
  baseHeaders
}) =>

  urlObj =
    switch typeof value
      when 'string'
        create:
          uri: => "#{baseUrl}/#{name}"
          method: 'POST'
          headers: baseHeaders
        fetch:
          uri: ({
            objectId
          }) =>
            "#{baseUrl}/#{name}/#{objectId}"
          method: 'GET'
          headers: baseHeaders
        reload:
          uri: =>
            console.log '这里是reload'
            "#{baseUrl}/#{name}"
          method: 'GET'
          headers: baseHeaders
        update:
          uri: ({
            objectId
          }) => "#{baseUrl}/#{name}/#{objectId}"
          method: 'PUT'
          headers: baseHeaders
        delete:
          uri: ({
            objectId
          }) => "#{baseUrl}/#{name}/#{objectId}"
          method: 'DELETE'
          headers: baseHeaders

      when 'function'
        value baseUrl

      when 'object'
        (
          Object.keys value
        )
        .reduce (r, c) =>
          {
            r...
            "#{c}": {
              uri: value[c]
              headers: baseHeaders
              url: baseUrl
            }
          }
        , {}

      else
        uri: baseUrl
        method: 'GET'
        headers: baseHeaders

  "#{name}": urlObj

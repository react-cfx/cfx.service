getBaseUrl = ({
  withSSL = false
  host = 'localhost'
  port = '3000'
  prefix = ''
}) =>
  [
    # http(s)
    'http'
    if withSSL? and (withSSL is true)
    then 's'
    else ''

    '://'

    host

    # port
    if ("#{port}" is '0') or ("#{port}" is '80')
    then ''
    else ":#{port}"

    # prefix
    if prefix is ''
    then ''
    else "/#{prefix}"

  ].join ''

getUrlObj = ({
  name
  value
  baseUrl
  baseHeaders
}) =>

  urlObj = {}
  switch typeof value
    when 'string' then urlObj =
        create:
          uri: => "#{baseUrl}/classes/#{name}?fetchWhenSave=true"
          method: 'POST'
          headers: baseHeaders
        fetch:
          uri: ({
            objectId
          }) =>
            "#{baseUrl}/classes/#{name}/#{objectId}"
          method: 'GET'
          headers: baseHeaders
        reload:
          uri: =>
            console.log '这里是reload'
            "#{baseUrl}/classes/#{name}"
          method: 'GET'
          headers: baseHeaders
        update:
          uri: ({
            objectId
          }) => "#{baseUrl}/classes/#{name}/#{objectId}"
          method: 'PUT'
          headers: baseHeaders
        delete:
          uri: ({
            objectId
          }) => "#{baseUrl}/classes/#{name}/#{objectId}"
          method: 'DELETE'
          headers: baseHeaders
    when 'function' then urlObj = value baseUrl
    when 'object' then urlObj =
     (Object.keys value).reduce (r, c) =>
        {
          r...
          "#{c}": {
            uri: value[c]
            headers: baseHeaders
            url: baseUrl
          }
        }
      , {}
    else urlObj =
      uri: baseUrl
      method: 'GET'
      headers: baseHeaders

  "#{name}": urlObj

getUrlObjs = ({
  urlConf
  business
}) =>
  # 拿到基本链接，基本header
  baseUrl = getBaseUrl urlConf
  baseHeaders =
    if urlConf?.headers?
    then (
      if urlConf.headers["Content-Type"]?
      then urlConf.headers
      else {
        urlConf.headers...
        "Content-Type": 'application/json'
      }
    )
    else "Content-Type": 'application/json'

  # 遍历business的键，调用getObj，传进去business各属性
  # 在这里批量生成链接对象
  (
    Object.keys business
  ).reduce (r, c) =>
    {
      r...
      (
        getUrlObj {
          name: "#{c}"
          value: business["#{c}"]
          baseUrl
          baseHeaders
        }
      )...
    }
  , {}

getServices = ({
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

getSpecialServices = ({
  urlObjs
  request
}) =>
  (
    Object.keys urlObjs
  ).reduce (r, c) ->
    urlObj = urlObjs["#{c}"]
    baseUrl = urlObj.url
    headers = urlObj.headers
    func = urlObj.uri {
      request
      baseUrl
      headers
    }
    {
     r...
     # 返回的这个函数就是用户在business里定义的函数
     "#{c}": func
     }
  , {}

getGroupServices = ({
  urlObjs
  request
}) =>
  (
    Object.keys urlObjs
  ).reduce (r, c) =>
    if urlObjs["#{c}"].create
      {
        r...
        "#{c}": getServices
          urlObjs: urlObjs["#{c}"]
          request: request
      }
    else
      {
        r...
        "#{c}": getSpecialServices
          urlObjs: urlObjs["#{c}"]
          request: request

      }
  , {}

export {
  getBaseUrl
  getUrlObj
  getUrlObjs
  getGroupServices
}

export default ({
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

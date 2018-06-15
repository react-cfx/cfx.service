import getBaseUrl from './BaseUrl'
import getUrlObj from './UrlObj'

export default ({
  urlConf
  business
}) =>
  # 拿到基本链接，基本 header
  baseUrl = getBaseUrl {
    urlConf
    business
  }
  jsonContent =
    "Content-Type": 'application/json'
  baseHeaders =
    if urlConf?.headers?
    then (
      if urlConf.headers["Content-Type"]?
      then urlConf.headers
      else {
        urlConf.headers...
        jsonContent...
      }
    )
    else jsonContent

  # 遍历 business 的键，调用 getObj，传进去 business 各属性
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
          (
            if baseUrl["#{c}"]?
            then baseUrl: baseUrl["#{c}"]
            else { baseUrl }
          )...
          baseHeaders
        }
      )...
    }
  , {}

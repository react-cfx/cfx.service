import getBaseUrl from './getBaseUrl'
import getUrlObj from './getUrlObj'

export default ({
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

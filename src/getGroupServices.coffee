import getServices from './getServices'
import getSpecialServices from './getSpecialServices'

export default ({
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

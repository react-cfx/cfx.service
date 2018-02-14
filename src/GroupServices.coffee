import getServices from './Services'
import getSpecialServices from './SpecialServices'

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

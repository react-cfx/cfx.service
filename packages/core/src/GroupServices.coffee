# import dd from 'ddeyes'
import createService from './ServiceCreate'

export default ({
  urlObjs
  request
}) =>

  (
    Object.keys urlObjs
  ).reduce (r, c) =>
    {
      r...
      "#{c}": createService
        urlObjs: urlObjs[c]
        request: request
    }
  , {}

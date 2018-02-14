import getBaseUrl from './BaseUrl'
import getUrlObj from './UrlObj'
import getUrlObjs from './UrlObjs'
import getGroupServices from './GroupServices'

export {
  getBaseUrl
  getUrlObj
  getUrlObjs
  getGroupServices
}

export default ({
  request
  urlConf
  business
}) =>

  urlObjs = getUrlObjs {
    urlConf
    business
  }

  getGroupServices {
    urlObjs
    request
  }

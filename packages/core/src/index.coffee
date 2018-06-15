import getBaseUrl from './BaseUrl'
import getUrlObj from './UrlObj'
import getUrlObjs from './UrlObjs'
import getGroupServices from './GroupServices'
import _request from './request'

export {
  getBaseUrl
  getUrlObj
  getUrlObjs
  getGroupServices
}
export request = _request

export default ({
  request = _request
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

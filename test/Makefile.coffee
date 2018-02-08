import 'shelljs/make'
import request from './request'
import {
  getBaseUrl
  getUrlObj
  getUrlObjs
  getGroupServices
} from '../src/index'

LC_Key =
  id: 'WyFCBFVhpqAJLICj7E6dh8wo-gzGzoHsz'
  key: 'MiEapSUoASsJs6CPshRRpkWs'

urlConf =
  withSSL: true
  host: "#{LC_Key.id[0..7].toLowerCase()}.api.lncld.net"
  port: 80
  prefix: '1.1/classes'
  headers:
    "X-LC-Id": LC_Key.id
    "X-LC-Key": LC_Key.key

# console.log getBaseUrl urlConf

# 配置所需方法
business = {
  'Room'
  'Bed'
}


# 根据链接配置拿到链接对象
urlObjs = getUrlObjs {
  urlConf
  business
}
# console.log urlObjs

# 根据链接对象拿到发送数据请求的方法
services = getGroupServices {
  urlObjs
  request
}
console.log services

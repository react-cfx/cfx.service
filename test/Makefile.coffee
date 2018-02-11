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
  prefix: '1.1'
  headers:
    "X-LC-Id": LC_Key.id
    "X-LC-Key": LC_Key.key

# console.log getBaseUrl urlConf

# 配置所需方法
business = {
  login:
    # 这个函数被getSpecialServices函数调用
    # 然后返回里面自定义的函数
    signin: ({
      request
      baseUrl
      headers
    }) =>
      (data) =>
        url = "#{baseUrl}/users"
        request url
        , {
          method: 'post'
          headers: headers
          data
        }
    login: ({
      request
      baseUrl
      headers
    }) =>
      (data) =>
        url = "#{baseUrl}/login"
        request url
        , {
          method: 'post'
          headers: headers
          data
        }
    changePW: ({
      request
      baseUrl
      headers
    }) =>
      (data) =>
        objectId = data.objectId
        url = "#{baseUrl}/users/#{objectId}/updatePassword"
        newHeaders = {
          headers...
          'X-LC-Session': data.token
        }
        request url
        , {
          method: 'put'
          headers: newHeaders
          data
        }
}


urlObjs = getUrlObjs {
  urlConf
  business
}

services = getGroupServices {
  urlObjs
  request
}

signin = () ->
  services.login.signin
    username: "陈欢"
    password: "123"
    phone: "18612340000"

login = () ->
  data = await services.login.login
    username: "陈欢"
    password: "123"
  console.log data

changePW = () ->
  dataChange = await services.login.changePW
    token: 'i5rcme69mfyil0zznr8nar3jg'
    objectId: '5a7fe44e9f54540070ebbf82'
    old_password: "123"
    new_password: "111"
  console.log dataChange

  # dataRight = await services.login.login
  #   username: "刘章仁"
  #   password: "111"
  # console.log dataRight

# signin()
# login()
changePW()

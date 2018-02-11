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
# https://wyfcbfvh.api.lncld.net/1.1


# 注册
# curl -X POST \
#   -d '{"username":"hjiang","password":"f32@ds*@&dsa","phone":"18612340000"}' \
#   https://wyfcbfvh.api.lncld.net/1.1/users

# 登录
# curl -X POST \
# -d '{"username":"hjiang","password":"f32@ds*@&dsa"}' \
# https://wyfcbfvh.api.lncld.net/1.1/login

# 修改密码
# curl -X PUT \
#   -H "X-LC-Session: qmdj8pdidnmyzp0c7yqil91oc" \
#   -d '{"old_password":"the_old_password", "new_password":"the_new_password"}' \
#   https://wyfcbfvh.api.lncld.net/1.1/users/55a47496e4b05001a7732c5f/updatePassword


# 配置所需方法
business = {
  'Room'
  'Bed'
  login:
    # 这个函数被getSpecialServices函数调用
    signin: ({
      request
      baseUrl
      headers
    }) =>
      (data) =>
        console.log data
        url = "#{baseUrl}/users"
        # request url
        # , {
        #   method: 'post'
        #   headers: headers
        #   data
        # }
    login: ({
      request
      urlConf
    }) =>
      ({
        ObjectId
        data
      }) =>
        url = 'xxx'
        request url
        , {
          method: 'post'
          headers: null
          data
        }
    changePW: ({
      request
      urlConf
    }) =>
      ({
        ObjectId
        data
      }) =>
        url = 'xxx'
        request url
        , {
          method: 'post'
          headers: null
          data
        }
}


urlObjs = getUrlObjs {
  urlConf
  business
}
console.log urlObjs

services = getGroupServices {
  urlObjs
  request
}
console.log services

services.login.signin '这里是signin2'

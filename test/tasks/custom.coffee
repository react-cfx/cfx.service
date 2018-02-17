import dd from 'ddeyes'
import request from '../request'
import getService from '../../src/index'

export default =>

  LC_Key =
    id: '9tlaHgssLwFJH3WVhV5Dw14u-gzGzoHsz'
    key: 'Aa3byUgORQCHGwFeKKdXngS9'

  urlConf =
    withSSL: true
    host: "#{LC_Key.id[0..7].toLowerCase()}.api.lncld.net"
    prefix: ({
      business
    }) =>
      base = '1.1'
      (
        Object.keys business
      ).reduce (r, c) =>
        {
          r...
          "#{c}":
            if c in [
              'todos'
            ]
            then "#{base}/classes"
            else base
        }
      , {}
    headers:
      "X-LC-Id": LC_Key.id
      "X-LC-Key": LC_Key.key

  business = {
    login:

      register:
        uri: ({
          baseUrl
        }) => "#{baseUrl}/users"
        method: 'POST'

      login: ({
        request
        baseUrl
        headers
      }) =>
        ({
          username
          password
          otherParams...
        }) =>
          request "#{baseUrl}/login"
          , {
            method: 'POST'
            headers
            data: {
              username
              password
              otherParams...
            }
          }
    'todos'
  }

  services = getService {
    urlConf
    business
    request
  }

  try
    user = await services.login.register
      username: 'footearth'
      password: 'netserver'

  catch e
    console.error e

  dd { user } if user?

  user = await services.login.login
    username: 'footearth'
    password: 'netserver'

  dd { user }

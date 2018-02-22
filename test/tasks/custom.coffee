import dd from 'ddeyes'
import getService from '../../src/index'
import urlConf from './LcUrlConf'

export default =>

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

import dd from 'ddeyes'
import 'shelljs/make'
import request from './request'

import getService from '../src/index'

target.all = =>
  dd 'Hello World!!!'

target.jsonServer = =>

  urlConf =
    host: '0.0.0.0'
    port: 3000
    prefix: ''
    # headers:
    #   "X-LC-Id": LC_Key.id
    #   "X-LC-Key": LC_Key.key

  business = {
    'todos'
  }

  services = getService {
    request
    urlConf
    business
  }

  todos = await services.todos.create
    id: '01'
    todo: 'Hello Todos.'
    isCompleted: false

  dd todos

target.leanCloud = =>

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
    'todos'
  }

  services = getService {
    urlConf
    business
    request
  }

  todos = await services.todos.create
    id: '01'
    todo: 'Hello Todos.'
    isCompleted: false

  dd todos

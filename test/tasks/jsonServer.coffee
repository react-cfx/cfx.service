import dd from 'ddeyes'
import request from '../request'
import getService from '../../src/index'

export default =>

  urlConf =
    host: '0.0.0.0'
    port: 3000
    prefix: ''

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

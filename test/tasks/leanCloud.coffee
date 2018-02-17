import dd from 'ddeyes'
import request from '../request'
import getService from '../../src/index'
import urlConf from './LcUrlConf'

export default =>

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

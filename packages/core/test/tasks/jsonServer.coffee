import dd from 'ddeyes'
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
    urlConf
    business
  }

  try
    todos = await services.todos.create
      id: '01'
      todo: 'Hello Todos.'
      isCompleted: false
  catch e
    dd
      message: e()
      stack: e.stack()

  dd todos

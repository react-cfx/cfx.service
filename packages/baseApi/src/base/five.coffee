import dd from 'ddeyes'
import Base from './index'

export default (name, crypto, Service, checkToken) =>
  [
    'list'
    'get'
    'create'
    'update'
    'remove'
  ].reduce (r, c) =>
    {
      r...
      "#{c}": 
        if checkToken?
        then checkToken Base[c] Service, name, crypto
        else Base[c] Service, name, crypto
    }
  , {}
  

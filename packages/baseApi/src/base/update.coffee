import dd from 'ddeyes'
import { json, send } from 'micro'
import {
  dataClean
  cryptoData
  decode
} from '../util'

export default (Service, name, crypto) => (req, res) =>

  objectId = Base64.decode req.params.objectId

  body = await json req
  {
    token
    _body...
  } = body
  
  cryptoBody = cryptoData _body, crypto, true

  result = await Service[name].update {
    objectId
    cryptoBody...
  }

  newObjectId = result.objectId

  result = await Service[name].fetch
    objectId: newObjectId

  send res, 200
  ,
    await Promise.resolve (
      dataClean result
      , {
        crypto
      }
    )

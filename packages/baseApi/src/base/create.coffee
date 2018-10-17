import dd from 'ddeyes'
import { json, send } from 'micro'
import {
  cryptoData
  dataClean
} from '../util'

export default (Service, name, crypto) => (req, res) =>
  
  body = await json req

  {
    token
    _body...
  } = body
  
  cryptoBody = cryptoData _body, crypto, true

  try
    { objectId } = await Service[name].create cryptoBody
  catch e
    send res , 200, []

  result = await Service[name].fetch {
    objectId
  }

  send res, 200
  ,
    await Promise.resolve (
      dataClean result
      , {
        crypto
      }
    )

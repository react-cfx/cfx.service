import dd from 'ddeyes'
import { json, send } from 'micro'
import {
  dataClean
  decode
} from '../util'

export default (Service, name, crypto) => (req, res) =>
  objectId = decode req.params.objectId

  await Service[name].delete {
    objectId
  }

  result = await Service[name].fetch {
    objectId
  } 

  result =
    if (typeof result is 'object') and
    ( (JSON.stringify result) is '{}' )
    then { objectId }
    else
      eror:
        code: 201
        message: 'remove error'

  send res, 200
  ,
    await Promise.resolve (
      dataClean { objectId }
      , {
        crypto
      }
    )

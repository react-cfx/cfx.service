import dd from 'ddeyes'
import { json, send } from 'micro'
import {
  dataClean
  decode
} from '../util'

export default (Service, name, crypto) => (req, res) =>

  body = await json req

  objectId = decode req.params.objectId

  result = await Service[name].fetch {
    objectId
  }

  send res, 200
  ,
    await Promise.resolve JSON.stringify (
      dataClean result
      , {
        crypto
      }
    )



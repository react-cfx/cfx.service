import dd from 'ddeyes'
import { json, send } from 'micro'
import {
  dataClean
  decode
  encode
} from '../util'

export default (
  Service, name, byData
  crypto
  uniqueness
) => (req, res) =>

  { objectId } = req.params

  try
    { results } = await Service[name].fetch byData objectId
  catch e
    send res, 200, []
  if uniqueness is true

    if results.length is 1

      result = results[0]
      send res, 200
      ,
        await Promise.resolve (
          dataClean result
          , {
            crypto
          }
        )
    else
      send res, 200
      ,
        await Promise.resolve 
          eror:
            code: 202
            message: 'Violation Uniqueness Constraints'
    
  else
    if name is 'buOrder'
      send res, 200, results.reduce (r, c) =>
        [
          r...
          (Object.keys c).reduce (_r, _c) =>
            {
              _r...
              (
                if (_c.toUpperCase().indexOf 'ID') isnt -1
                then  "#{_c}": encode c[_c]
                else "#{_c}": c[_c]
              )...
            }
          , {}
        ]
      , []
    else
      send res, 200
      ,
        await Promise.resolve (
          dataClean results
          , {
            crypto
          }
        )
  # else
  #   send res, 200, 'token过期，请重新登录'
 

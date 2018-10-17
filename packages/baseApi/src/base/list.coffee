import dd from 'ddeyes'
import { json, send } from 'micro'
import { dataClean, cryptoData, encode } from '../util'

export default (Service, name, crypto) => (req, res) =>

  try
    { results } = await Service[name].fetch()
  catch e
    send res, 200, []

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
      await Promise.resolve JSON.stringify (
        dataClean results
        , {
          crypto
        }
      )

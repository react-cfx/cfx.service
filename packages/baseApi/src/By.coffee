import dd from 'ddeyes'
import { decode } from './util'
import Base from './base'

export default (encodeData, crypto, Service) => (
  Object.keys crypto
).reduce (r, c) =>
  {
    r...
    "#{c}": crypto[c].reduce (_r, _c) =>
      {
        _r...
        "getBy#{_c[0].toUpperCase()}#{_c[1..]}": Base.getBy(
          Service, c
          (key) =>
            _key = 
              if (_c.toUpperCase().indexOf 'ID') is -1
              then key
              else decode key
            where:
              JSON.stringify
                "#{_c}": _key
          encodeData[c]
        )
      }
    , {}
  }
, {}
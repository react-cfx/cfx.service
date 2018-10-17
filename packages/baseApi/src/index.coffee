import dd from 'ddeyes'
import five from './base/five'
import By from './By'
export default (business, Service, encodeData, crypto, checkToken) => 
  business.reduce (r, c) =>
    _encodeData =
      if encodeData[c]?
      then encodeData[c]
      else {}
    {
      r...
      "#{c}":
        if c in Object.keys encodeData
          if checkToken?
          then {
            ( five c, _encodeData, Service, checkToken )...
            (By encodeData, crypto, Service)[c]...
          }
          else {
            ( five c, _encodeData, Service )...
            (By encodeData, crypto, Service)[c]...
          }
        else
          if checkToken?
          then five c, _encodeData, Service, checkToken
          else five c, _encodeData, Service
    }
  , {}
import dd from 'ddeyes'
import { Base64 } from 'js-base64'

encode = Base64.encodeURI
decode = Base64.decode

withoutKeys = (
  data
  keys = [
    'createdAt'
    'updatedAt'
  ]
) =>
  return data unless ( typeof data ) is 'object'
  keys = [
    'createdAt'
    'updatedAt'
  ] unless Array.isArray keys

  keys = [
    keys...
    'createdAt'
    'updatedAt'
  ]

  (
    Object.keys data
  ).reduce (r, c) =>
    {
      r...
      (
        if (keys.indexOf c) is -1
        then "#{c}": data[c]
        else {}
      )...
    }
  , {}

cryptoData = (
  data
  keys = [
    'objectId'
  ]
  decodeMode = false
) =>

  return data unless ( typeof data ) is 'object'
  keys = [
    'objectId'
  ] unless Array.isArray keys

  keys = [
    keys...
    'objectId' 
  ]

  res = (
    Object.keys data
  ).reduce (r, c) =>
    {
      r...
      (
        unless (keys.indexOf c) is -1
        then "#{c}":
          if decodeMode is false
          then encode data[c]
          else decode data[c]
        else "#{c}": data[c]
      )...
    }
  , {}
  # dd encode '123456' 
  res

dataClean = (
  data
  handleData = {}
) =>
  {
    crypto
    without
  } = handleData

  if (Array.isArray data) is true

    result = data.reduce (r, c) =>
      [
        r...
        cryptoData (withoutKeys c, without), crypto
      ]
    , []

    if result?
    then result
    else []

  else if typeof data is 'object'
    result = cryptoData (withoutKeys data, without), crypto

    if result?
    then result
    else {}

  else data

export {
  dataClean
  cryptoData
  encode
  decode
}

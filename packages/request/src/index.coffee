# import dd from 'ddeyes'
import axios from 'axios'
import axiosRetry from 'axios-retry';

axiosRetry axios
,
  retries: 3

export default (
  url
  mainOpts = {} 
  opts
) =>
  # dd {
  #   url
  #   method
  #   headers
  #   data
  # }

  {
    method = 'GET'
    headers
    data = ''
  } = mainOpts

  {
    timeout
    retries
    otherOpts
  } = opts if opts?.timeout?

  axios {
    url
    method
    headers
    data
    timeout:
      if timeout?
      then timeout
      else 1000

    (
      if retries?
      then (
        'axios-retry':
          retries: 0
      )
      else {}
    )...

    (
      if otherOpts?
      then otherOpts
      else (
        if opts
        then opts
        else {}
      )
    )...

  }

  .then (response) =>
    # dd response
    response.data if (
      response.status >= 200 and
      response.status < 300
    )

  .catch (error) =>
    e = =>
      if error.response?.data?
        return error.response.data
      if error.response?
        return error.response
      if error.message?
        return error.message
      if error.stack?
        return error.stack
      return error
    e.e = error
    throw e
    

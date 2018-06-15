# import dd from 'ddeyes'
import axios from 'axios'

export default (
  url
  {
    method
    headers
    data = ''
  }
) =>
  # dd {
  #   url
  #   method
  #   headers
  #   data
  # }
  axios {
    url
    method
    headers
    data
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
    

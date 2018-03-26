import dd from 'ddeyes'
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
    e = => error.message
    e.stack = => error.stack
    e.e = {
      error
      e:
        response: error.response
        e:
          data: error.response.data
    }
    throw e
    

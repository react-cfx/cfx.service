import axios from 'axios'
import dd from 'ddeyes'

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
    method: method
    headers: headers
    url
    data
  }

  .then (response) =>
    # dd response
    response.data if (
      response.status >= 200 and
      response.status < 300
    )

  .catch (error) =>
    console.error error.response.data

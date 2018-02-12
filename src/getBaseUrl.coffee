export default ({
  withSSL = false
  host = 'localhost'
  port = 80
  prefix = ''
}) => [
  # http(s)
  'http'
  if withSSL? and (withSSL is true)
  then 's'
  else ''

  '://'

  host

  # port
  if ("#{port}" is '0') or ("#{port}" is '80')
  then ''
  else ":#{port}"

  # prefix
  if prefix is ''
  then ''
  else "/#{prefix}"

].join ''

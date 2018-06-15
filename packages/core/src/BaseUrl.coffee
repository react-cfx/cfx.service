export default ({
  urlConf: {
    withSSL = false
    host = 'localhost'
    port = 80
    prefix = ''
  }
  business
}) =>
  newPrefix =
    switch typeof prefix
      when 'string' then prefix
      when 'function' then prefix { business }
      else prefix
    
  UrlWithoutPrefix = [
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
    # if newPrefix is ''
    # then ''
    # else "/#{prefix}"

  ].join ''

  switch typeof newPrefix
    when 'string'
    then (
      if newPrefix is ''
      then UrlWithoutPrefix
      else "#{UrlWithoutPrefix}/#{newPrefix}"
    )
    when 'object'
    then (
      Object.keys newPrefix
    ).reduce (r, c) =>
      {
        r...
        "#{c}": (
          if newPrefix["#{c}"] is ''
          then UrlWithoutPrefix
          else "#{UrlWithoutPrefix}/#{newPrefix["#{c}"]}"
        )
      }
    , {}

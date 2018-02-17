LC_Key =
  id: '9tlaHgssLwFJH3WVhV5Dw14u-gzGzoHsz'
  key: 'Aa3byUgORQCHGwFeKKdXngS9'

urlConf =
  withSSL: true
  host: "#{LC_Key.id[0..7].toLowerCase()}.api.lncld.net"
  prefix: ({
    business
  }) =>
    base = '1.1'
    (
      Object.keys business
    ).reduce (r, c) =>
      {
        r...
        "#{c}":
          if c in [
            'todos'
          ]
          then "#{base}/classes"
          else base
      }
    , {}
  headers:
    "X-LC-Id": LC_Key.id
    "X-LC-Key": LC_Key.key

export default urlConf

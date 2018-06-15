export default
  write: true
  registry: 'https://registry.npm.taobao.org'
  prefix: '~'
  devprefix: '^'
  plugin: ''
  test: []
  dep: [
    'lerna'
  ]
  devdep: [
    'autod'
    'cfx.require-plugin-coffee'
  ]
  exclude: [
    './packages'
    './.autod.conf.js'
  ]

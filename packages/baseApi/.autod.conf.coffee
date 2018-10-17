export default
  write: true
  registry: 'https://registry.npm.taobao.org'
  prefix: '~'
  devprefix: '^'
  plugin: ''
  test: []
  dep: [
    "cfx.require-plugin-coffee"
    "cfx.rollup-plugin-coffee2"
    "cfx.service.core"
    "cfx.service.request"
    "del"
    "dotenv"
    "gulp"
    "gulp-better-rollup"
    "gulp-rename"
    "gulp-sequence"
    "js-base64"
    "micro"
    "micro-cors"
    "microrouter"
    "rollup"
    "rollup-plugin-async"
    "rollup-plugin-cleanup"
  ]
  devdep: [
    "autod"
    "cfx.simple-build-tool"
    "ddeyes"
    "micro-dev"
    "js-cookie"
    "shelljs"
    "short-uuid"
  ]
  exclude: [
    './node_modules'
    './.autod.conf.js'
  ]

export default
  write: true
  registry: 'https://registry.npm.taobao.org'
  prefix: '~'
  devprefix: '^'
  plugin: ''
  test: []
  dep: [
    'axios'
    'axios-retry'
    'cfx.require-plugin-coffee'
    'cfx.rollup-plugin-coffee2'
    'del'
    'gulp'
    'gulp-better-rollup'
    'gulp-rename'
    'gulp-sequence'
    'rollup'
    'rollup-plugin-cleanup'
  ]
  devdep: [
    'autod'
    'ddeyes'
    'shelljs'
  ]
  exclude: [
    './node_modules'
    './.autod.conf.js'
  ]

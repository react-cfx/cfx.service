import dd from 'ddeyes'
import 'shelljs/make'
import request from '../src'

target.all = =>

  data = await request 'https://registry.npm.taobao.org/ddeyes'

  dd data

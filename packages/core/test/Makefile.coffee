import dd from 'ddeyes'
import 'shelljs/make'
import * as tasks from './tasks'

target.all = =>
  dd 'Hello World!!!'

target.jsonServer = =>
  tasks.jsonServer()

target.leanCloud = =>
  tasks.leanCloud()

target.custom = =>
  tasks.custom()
 
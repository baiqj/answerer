#!/usr/bin/env coffee

server = require './server'
database = require './database'

database.init()

.then server

.catch (reason) ->
  if Object::toString.call reason is '[Object Error]'
    throw reason
  console.error 'error', reason
  process.exit(1)

.progress (progress) ->
  console.info progress

.done()
#!/usr/bin/env coffee

express = require 'express'

express().get('/', (req, res) ->
  res.send('hello world.')
).listen(3000)

console.log 'App listening to 3000'

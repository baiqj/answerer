#!/usr/bin/env coffee

PORT = process.env['PORT'] or 3000

express = require 'express'

express().get('/', (req, res) ->
  res.send('hello world.')
).listen(PORT)

console.log "Server listening on #{PORT}"

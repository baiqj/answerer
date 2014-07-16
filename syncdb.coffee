#!/usr/bin/env coffee

database = require './database'

database.init(true).then ->
  process.exit(0)
, (reason) ->
  console.error reason.toString()
  process.exit(1)
, (progress) ->
  console.info progress

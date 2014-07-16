express = require 'express'
{promise} = require 'q'

PORT = process.env['PORT'] or 3000

module.exports = ->
  promise (resolve, reject, notify) ->
    app = express()
    app.use '/api', require './api'
    app.listen PORT, ->
      notify "Server listenning on #{PORT}"
      resolve

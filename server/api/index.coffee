express = require 'express'

exports = module.exports = express()

for resource in ['category']
  callback = require "./#{resource}"
  exports
    .all "/#{resource}", callback
    .all "/#{resource}/:id", callback
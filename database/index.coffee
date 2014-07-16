pg = require 'pg'
{promise} = require 'q'

DATABASE_URL = process.env['DATABASE_URL'] or 'postgres://postgres:postgres@localhost/answerer'

exports = module.exports = ->
  promise (resolve, reject, notify) ->
    pg.connect DATABASE_URL, (err, client, done) ->
      if err? then return reject err
      client.done = done
      resolve client

exports.init = require('./init')

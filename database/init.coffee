{all, promise} = require 'q'

database = require './'
structures = require './structures'

create = (force, client, table, structure) ->
  promise (resolve, reject, notify) ->
    create_table = ->
      client.query "CREATE TABLE #{table} (#{structure});", (err) ->
        if err?
          reject err
        else
          notify "Table #{table} created"
          resolve()

    if force
      client.query "DROP TABLE #{table} CASCADE;", (err, result) ->
        unless err?
          notify "Table #{table} dropped"
        else if err.code is '42P01' # table not exists
          notify "Table #{table} not exists"
        else
          return reject err
        create_table()
    else
      client.query "SELECT * FROM #{table} WHERE false;", (err, result) ->
        unless err?
          notify "Table #{table} exists"
          resolve()
        else if err.code is '42P01' # table not exists
          notify "Table #{table} not exists"
          create_table()
        else
          reject err

module.exports = (force = false) ->
  promise (resolve, reject, notify) ->
    database().then (client) ->
      notify 'Database Connected'
      all(create force, client, table, structure for table, structure of structures)
      .progress (progress) -> progress.value
    .progress notify
    .fail reject
    .done resolve

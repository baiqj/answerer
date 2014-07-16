database = require '../../database'

module.exports = (req, res) ->
  unless req.params['id']
    database().then ->
      
  else
    res.json
      id: 0
      text: 'foo'

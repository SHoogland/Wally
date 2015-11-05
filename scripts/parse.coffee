# Description:
#   fetching data from Parse.com
#
# Commands:
#   hubot parse - fetch something from wally's Parse brain

module.exports = (robot) ->
  robot.respond /parse (.*)/i, (res) ->
    Parse = require('parse/node')
    res.send "done!"

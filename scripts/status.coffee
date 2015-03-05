# Description:
#   status script to test if the deployment succeeded from codeship
#

module.exports = (robot) ->
  robot.router.get '/status', (req, res) ->
    res.writeHead 200, {'Content-Type': 'text/plain'}
    res.end 'Me is alive!!!!!\n'

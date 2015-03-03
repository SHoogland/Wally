# Description:
#   status script to test if the deployment succeeded from codeship
#

module.exports = (robot) ->
  robot.router.post '/papertrail/:room', (req, res) ->
    room = req.params.room
    data = JSON.parse req.body.payload

    robot.send {room: room}, 'Papertrail: #{data}'

    res.send 'Ok'

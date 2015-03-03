# Description:
#   status script to test if the deployment succeeded from codeship
#

module.exports = (robot) ->
  robot.router.post '/papertrail/:room', (req, res) ->
    console.log req
    room = req.params.room
    data = JSON.parse req.body.payload

    robot.send {room: room}, 'Papertrail: ' + data.events[0].hostname

    res.send 'Ok'

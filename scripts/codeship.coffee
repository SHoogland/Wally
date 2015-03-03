# Description:
#   status script to test if the deployment succeeded from codeship
#

module.exports = (robot) ->
  robot.router.post '/papertrail/', (req, res) ->
   data   = JSON.parse req.body.payload

   robot.messageRoom "general", data

   res.send 'OK'

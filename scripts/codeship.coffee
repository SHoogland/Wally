# Description:
#   sending messages to chat for codeship builds
#

module.exports = (robot) ->
  robot.router.post '/codeship/:channel', (req, res) ->
    channel = req.params.channel
    data = JSON.parse req.body.payload

    payload =
      channel: channel
      content:
        text: data.build.committer + ' pushed: "' + data.build.message + '" to ' + data.build.branch
        fallback: "Codeship: build " + data.build.status
        mrkdwn_in: ['text']

    robot.emit 'slack-attachment', payload
    res.send 'Ok'

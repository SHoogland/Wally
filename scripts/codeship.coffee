# Description:
#   sending messages to chat for codeship builds
#

module.exports = (robot) ->
  robot.router.post '/codeship/:channel', (req, res) ->
    channel = req.params.channel
    data = JSON.parse req.body.build

    payload =
      channel: channel
      content:
        text: data.committer + ' pushed: "' + data.message + '" to ' + data.branch
        fallback: "Codeship: build " + data.status
        mrkdwn_in: ['text']

    robot.emit 'slack-attachment', payload
    res.send 'Ok'

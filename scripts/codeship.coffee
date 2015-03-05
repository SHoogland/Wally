# Description:
#   sending messages to chat for codeship builds
#

module.exports = (robot) ->
  robot.router.post '/codeship/:channel', (req, res) ->
    channel = req.params.channel
    console.log(req)
    # data = JSON.parse req.body.payload

    # payload =
    #   channel: channel
    #   content:
    #     text: "```" + text + "```"
    #     fallback: "Papertrail: " + name
    #     pretext: '"' + name + '" search found ' + count + ' match(es) - ' + link
    #     mrkdwn_in: ['text', 'pretext']
    #
    # robot.emit 'slack-attachment', payload
    res.send 'Ok'

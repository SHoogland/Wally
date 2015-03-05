# Description:
#   sending messages to chat for papertrail alerts
#

module.exports = (robot) ->
  robot.router.post '/papertrail/:channel', (req, res) ->
    channel = req.params.channel
    data = JSON.parse req.body.payload
    name = data.saved_search.name
    count = data.events.length
    link = data.saved_search.html_search_url

    text = ''
    text += event.message + '\n' for event in data.events

    payload =
      channel: channel
      content:
        text: "```" + text + "```"
        fallback: "Papertrail: " + name
        pretext: '"' + name + '" search found ' + count + ' match(es) - ' + link
        mrkdwn_in: ['text', 'pretext']

    robot.emit 'slack-attachment', payload
    res.send 'Ok'

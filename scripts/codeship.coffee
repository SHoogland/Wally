# Description:
#   status script to test if the deployment succeeded from codeship
#

module.exports = (robot) ->
  robot.router.post '/papertrail/:channel', (req, res) ->
    channel = req.params.channel
    data = JSON.parse req.body.payload
    name = data.saved_search.name
    count = data.events.length
    link = data.saved_search.html_search_url

    payload =
      channel: channel
      content:
        text: "```Attachement Demo Text```"
        fallback: "New errors in logs"
        pretext: '"' + name + '" search found ' + count + ' match(es) - ' + link
        mrkdwn_in: ['text', 'pretext']

    robot.emit 'slack-attachment', payload
    res.send 'Ok'

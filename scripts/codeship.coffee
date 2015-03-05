# Description:
#   sending messages to chat for codeship builds
#

module.exports = (robot) ->
  robot.router.post '/codeship/:channel', (req, res) ->
    channel = req.params.channel
    data = req.body

    payloadStarted =
      channel: channel
      content:
        title: "Codeship build started"
        title_link: data.build.build_url
        text: '*' + data.build.committer + '* pushed to: "' + data.build.project_full_name + '"\nCommit: <' + data.build.commit_url + '|' + data.build.message + '>\nBranch: ' + data.build.branch
        fallback: "Build triggered for: " + data.build.project_full_name
        mrkdwn_in: ['text']
        color: 'warning'

    payloadSucces =
      channel: channel
      content:
        title: "Codeship build succeeded"
        title_link: data.build.build_url
        text: 'Triggered by: *' + data.build.committer + '* \nProject: "' + data.build.project_full_name + '"\nCommit: <' + data.build.commit_url + '|' + data.build.message + '>\nBranch: ' + data.build.branch
        fallback: "Build for: " + data.build.project_full_name + " succeeded"
        mrkdwn_in: ['text']
        color: 'good'

    payloadFailed =
      channel: channel
      content:
        title: "Codeship build failed"
        title_link: data.build.build_url
        text: 'Triggered by: *' + data.build.committer + '* \nProject: "' + data.build.project_full_name + '"\nCommit: <' + data.build.commit_url + '|' + data.build.message + '>\nBranch: ' + data.build.branch
        fallback: "Build for: " + data.build.project_full_name + " failed!"
        mrkdwn_in: ['text']
        color: 'danger'

    robot.emit 'slack-attachment', payloadStarted if data.build.status is 'testing'
    robot.emit 'slack-attachment', payloadSucces if data.build.status is 'success'
    robot.emit 'slack-attachment', payloadFailed if data.build.status is 'error'

    res.send 'Ok'

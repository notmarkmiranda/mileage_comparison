App.dashboard = App.cable.subscriptions.create "DashboardChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#dashboard').replaceWith(data.message)

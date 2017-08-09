class DashboardChannel < ApplicationCable::Channel
  def subscribed
    stream_from "dashboard_channel_#{current_user.dashboard_token}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

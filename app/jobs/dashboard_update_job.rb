class DashboardUpdateJob < ApplicationJob
  queue_as :default

  def perform(args, dashboard_token)
    ActionCable.server.broadcast("dashboard_channel_#{dashboard_token}", message: render_dashboard(args))
  end

  private

  def render_dashboard(stats)
    ApplicationController.renderer.render(partial: '/users/dashboard', locals: stats)
  end
end

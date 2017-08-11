class TriplogImportJob < ApplicationJob
  queue_as :default

  def perform(user)
    @client = TriplogService.new(user.triplog_email)
  end
end

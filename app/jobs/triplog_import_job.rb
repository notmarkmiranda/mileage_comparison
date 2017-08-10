class TriplogImportJob < ApplicationJob
  queue_as :default

  def perform(user)
    # triplog service
  end
end

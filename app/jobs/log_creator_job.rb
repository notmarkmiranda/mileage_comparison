class LogCreatorJob < ApplicationJob
  queue_as :default

  def perform(current, previous)
    require 'pry'; binding.pry
    # take the dates of current and previous
    # if the difference = 0 (same date), make a log for the current.date
    # THIS IS WHERE YOU STOPPED!
  end
end

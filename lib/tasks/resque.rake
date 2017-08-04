require 'resque/tasks'

namespace :resque do
  task :setup do
    require 'resque'
    ENV['QUEUE'] = '*'
    ENV['TERM_CHILD'] = '1'
    ENV['RESQUE_TERM_TIMEOUT'] = '10'

    Resque.redis = 'localhost:6379' unless Rails.env == 'production'
  end
end

Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }

desc 'Alias for resque:work (to run workers on heroku)'
task 'jobs:work' => 'resque:work'
# task 'resque:setup' => :environment do
  # Resque.before_fork = Proc.new do |job|
    # ActiveRecord::Base.connection.disconnect!
  # end

  # Resque.after_fork = Proc.new do |job|
    # ActiveRecord::Base.establish_connection
  # end
# end

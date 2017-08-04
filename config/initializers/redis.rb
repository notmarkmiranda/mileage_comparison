if Rails.env == 'production'
  uri = URI.parse(ENV['REDISTOGO_URL'])
  Resque.redis = Redis.new(:host => uri.hoset, :port => uri.port, :password => uri.password)
end

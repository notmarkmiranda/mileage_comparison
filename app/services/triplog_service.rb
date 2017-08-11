class TriplogService
  include HTTParty
  base_uri 'https://triplogmileage.com/web'

  def initialize(user)
    @options = { query: { 'userEmail' => user.triplog_email },
                 headers: { 'Authorization' => ENV['TRIPLOG_API_KEY'] } }
  end

  def summary
    self.class.get('/summary', @options)
  end

  private

  def connection
  end

  def set_params(user)
  end
end

require 'strava/api/v3'

class StravaService
  def self.authenticate(code)
    access_information = Strava::Api::V3::Auth.retrieve_access(ENV['strava_client_id'], ENV['strava_client_secret'], code)
    access_token = access_information['access_token']
    athlete_information = access_information['athlete']
    User.from_strava(access_token, athlete_information)
  end


  def self.client(access_token)
    @client = Strava::Api::V3::Client.new(access_token: access_token)
  end
end

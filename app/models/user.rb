class User < ApplicationRecord
  has_secure_password
  has_secure_token :dashboard_token
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :logs

  def strava_local_dissonance?(strava_count)
    strava_count != logs.pluck(:strava_id).count
  end

  def miles_variance
    manual = total_specific_miles(1)
    driven = total_specific_miles(0)
    manual - driven
  end

  def self.from_strava(access_token, athlete_info)
    user = find_or_create_by(strava_id: athlete_info['id'])
    populate_user_attributes(user, athlete_info, access_token)
  end

  def total_specific_miles(type)
    applicable_logs = logs.where(travel_type: type)
    applicable_logs.empty? ? 0 : applicable_logs.sum(&:distance)
  end

  def total_miles
    logs.sum(&:distance)
  end

  def update_token
    regenerate_dashboard_token
  end

  private

  def populate_user_attributes(user, athlete_info, access_token)
    user.access_token    = access_token
    user.first_name      = athlete_info['firstname']
    user.last_name       = athlete_info['lastname']
    user.profile_picture = athlete_info['profile']
    user.city            = athlete_info['city']
    user.state           = athlete_info['state']
    user.country         = athlete_info['country']
    user.email           = athlete_info['email']
    user.password        = SecureRandom.hex(9)
    user.save
    user
  end
end

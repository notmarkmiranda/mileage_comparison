class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :login, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :logs

  def miles_variance
    manual = total_specific_miles(1)
    driven = total_specific_miles(0)
    manual - driven
  end

  def total_specific_miles(type)
    applicable_logs = logs.where(travel_type: type)
    applicable_logs.empty? ? 0 : applicable_logs.sum(&:distance)
  end

  def total_miles
    logs.sum(&:distance)
  end
end

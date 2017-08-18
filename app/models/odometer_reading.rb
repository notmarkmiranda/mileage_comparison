class OdometerReading < ApplicationRecord
  default_scope { order(date: :asc) }
  validates_presence_of :date
  validates_presence_of :mileage

  has_many :logs
  belongs_to :user

  def previous(user)
    require 'pry'; binding.pry
    OdometerReading.where("id < ? AND user_id = ?", id, user.id).first
  end

  def self.other_readings?(user)
    OdometerReading.where("user_id = ?", user.id).any?
  end
end

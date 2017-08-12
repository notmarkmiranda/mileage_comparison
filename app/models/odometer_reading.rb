class OdometerReading < ApplicationRecord
  default_scope { order(date: :asc) }
  validates_presence_of :date
  validates_presence_of :mileage

  has_many :logs
  belongs_to :user
end

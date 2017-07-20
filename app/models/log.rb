class Log < ApplicationRecord
  validates_presence_of :user_id
  validates_presence_of :distance
  validates_presence_of :date
  validates_presence_of :travel_type

  belongs_to :user
end

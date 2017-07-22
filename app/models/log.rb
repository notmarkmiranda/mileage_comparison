class Log < ApplicationRecord
  default_scope { order(date: :asc) }
  validates_presence_of :user_id
  validates_presence_of :distance
  validates_presence_of :date
  validates_presence_of :travel_type

  belongs_to :user

  enum travel_type: [:driving, :manual]

  def blank_note_field?
    notes.blank?
  end

  def formatted_long_date
    date.strftime("%A, %B %e, %Y")
  end

  def number_for_user
    user.logs.sort_by(&:date).index(self) + 1
  end
end

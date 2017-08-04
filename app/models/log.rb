class Log < ApplicationRecord
  default_scope { order(activity_date: :asc) }
  validates_presence_of :user_id
  validates_presence_of :distance
  validates_presence_of :activity_date
  validates_presence_of :travel_type

  belongs_to :user

  enum travel_type: [:driving, :manual]

  def blank_note_field?
    notes.blank?
  end

  def formatted_long_date
    activity_date.strftime("%A, %B%e, %Y")
  end

  def number_for_user
    user.logs.sort_by(&:activity_date).index(self) + 1
  end

  def placeholder_date
    activity_date.nil? ? Date.today.to_s : activity_date
  end

  def truncated_name
    name.truncate(20, separator: ' ') if name
  end

end

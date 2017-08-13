FactoryGirl.define do
  sequence(:random_number) do |n|
    @random_number ||= (1..100).to_a.shuffle
    @random_number[n]
  end

  factory :user do
    sequence(:email) { |n| "asdf#{n}@gmail.com" }
    password "password"
    password_confirmation "password"
  end

  factory :driving_log, class: Log do
    user
    distance { FactoryGirl.generate(:random_number) }
    activity_date Date.new(2015, 5, 9)
    travel_type 'driving'
  end

  factory :manual_log, class: Log do
    user
    distance { FactoryGirl.generate(:random_number) }
    activity_date Date.new(2015, 5, 9)
    travel_type 'manual'
    notes 'note'
  end

  factory :odometer_reading do
    user
    date Date.new(2017, 5, 9)
    sequence(:mileage) { |n| "54332#{n}".to_i }
    notes 'new note'
  end
end

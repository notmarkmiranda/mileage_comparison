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
    date Date.new(2015, 5, 9)
    travel_type 'driving'
  end

  factory :manual_log, class: Log do
    user
    distance { FactoryGirl.generate(:random_number) }
    date Date.new(2015, 5, 9)
    travel_type 'manual'
  end
end

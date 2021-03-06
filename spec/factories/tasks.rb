FactoryBot.define do
  factory :task do
    name { Faker::Lorem.word }
    description { Faker::Lorem.word }
    daily_target { Faker::Number.number(digits: 4) }
  end
end

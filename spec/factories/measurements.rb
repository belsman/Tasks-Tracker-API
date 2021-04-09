FactoryBot.define do
  factory :measurement do
    value { Faker::Number.number(digits: 4) }
    user { Faker::Number.number(digits: 4) }
    task { Faker::Number.number(digits: 4) }
  end

  factory :user do
    username { Faker::Lorem.word }
  end
end

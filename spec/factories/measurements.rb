FactoryBot.define do
  factory :measurement do
    running { Faker::Number.number(digits: 2) }
    reading { Faker::Number.number(digits: 2) }
    coding { Faker::Number.number(digits: 2) }
    project { Faker::Number.number(digits: 2) }
    movie { Faker::Number.number(digits: 2) }
    user { Faker::Number.number(digits: 4) }
  end

  factory :user do
    username { Faker::Lorem.word }
    email { 'foo@bar.com' }
    password { 'foobar' }
  end
end

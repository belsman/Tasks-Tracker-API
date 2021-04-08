FactoryBot.define do
    factory :measurement do
      value { Faker::Number.number(digits: 20) }
      user { Faker::Number.number(digits: 10) }
      task { Faker::Number.number(digits: 10) }
    end
end
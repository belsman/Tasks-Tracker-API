FactoryBot.define do
    factory :measurement do
      value { Faker::Number.number(20) }
      user { Faker::Number.number(10) }
      task { Faker::Number.number(10) }
    end
end
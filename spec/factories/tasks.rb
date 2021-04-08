FactoryBot.define do
    factory :task do
      name {  Faker::Lorem.word }
      description { Faker::Lorem.word }
      measurement_unit {  Faker::Lorem.word }
      daily_target { Faker::Number.number(1) }
    end
end
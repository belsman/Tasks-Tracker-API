FactoryBot.define do
    factory :task do
      name {  Faker::Lorem.word } }
      description { Faker::Lorem.paragraphs(rand(20..70))}
      measurement_unit {  Faker::Lorem.word(2) } }
      daily_target { Faker::Number.number(5) }
    end
end
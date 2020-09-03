FactoryBot.define do
  factory :doctor do
    name { Faker::Name.name }
    age { Random.new(100) }
    hospital { Faker::Name.name }
    experience_level { Random.new(10) }
    specialty { Faker::Name.name }
  end
end

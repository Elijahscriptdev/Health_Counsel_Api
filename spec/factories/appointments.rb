# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    user
    doctor
    meeting_info { Faker::Lorem.sentence }
    date { Faker::Date.in_date_period }
    time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
  end
end

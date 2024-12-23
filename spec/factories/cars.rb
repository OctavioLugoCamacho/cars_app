FactoryBot.define do
  factory :car, class: 'Car' do
    plate_number { Faker::Vehicle.license_plate }
    model { Faker::Vehicle.model }
    year { Faker::Vehicle.year }
    created_at { "2023-05-14 12:27:14 UTC" }
    updated_at { "2023-05-14 14:07:14 UTC" }
  end
end

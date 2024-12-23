require 'faker'

20.times do
  Car.create(plate_number: Faker::Vehicle.license_plate, model: Faker::Vehicle.model, year: Faker::Vehicle.year)
end

50.times do
  MaintenanceService.create(description: Faker::Lorem.paragraph, status: Faker::Number.between(from: 0, to: 2), date: Faker::Date.backward(days: 14), car_id: Faker::Number.between(from: 1, to: 20))
end

20.times do
  password = Faker::Internet.password
  User.create(name: Faker::Name.name, email: Faker::Internet.email, admin: Faker::Boolean.boolean, password: password, password_confirmation: password)
end

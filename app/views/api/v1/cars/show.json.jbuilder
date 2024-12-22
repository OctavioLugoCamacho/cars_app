json.car do
  json.plate_number @car.plate_number
  json.model @car.model
  json.year @car.year
end

json.maintenance_services @car.maintenance_services do |maintenance_service|
  json.description maintenance_service.description
  json.status maintenance_service.status
  json.date maintenance_service.date
end

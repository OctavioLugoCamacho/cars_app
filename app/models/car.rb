class Car < ApplicationRecord
  validates :plate_number, uniqueness: {
    message: "- La placa %{value} ya existe en la Base de Datos."
  }
  validates :year, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1900,
    less_than_or_equal_to: ->(_brewery) { Date.current.year },
    message: "- Solo se admiten autos entre el año 1900 y el año actual."
  }
  validates_presence_of :model, message: "- Favor de introducir el modelo."
end

class MaintenanceService < ApplicationRecord
  belongs_to :car

  validates_presence_of :description, message: "- Favor de introducir la descripción."

  validates_comparison_of :date,  less_than_or_equal_to: -> { Date.today }, message: "- La fecha y hora deben ser menor o igual a la fecha y hora actual."

  enum :status, { pending: 0, in_progress: 1, completed: 2 }
end

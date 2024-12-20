class CreateMaintenanceServices < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_services do |t|
      t.string :description
      t.integer :status, default: 0
      t.datetime :date
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end

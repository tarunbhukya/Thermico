class CreateReadings < ActiveRecord::Migration[6.0]
  def change
    create_table :readings do |t|
      t.integer :thermostat_id
      t.integer :tracking_number
      t.float :temperature, default: 0.0
      t.float :humidity, default: 0.0
      t.float :battery_charge, default: 0.0

      t.timestamps
    end
    add_index :readings, :tracking_number
    add_index :readings, :thermostat_id
  end
end

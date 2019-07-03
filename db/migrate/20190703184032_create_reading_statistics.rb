class CreateReadingStatistics < ActiveRecord::Migration[6.0]
  def change
    create_table :reading_statistics do |t|
      t.integer :thermostat_id
      t.integer :number_of_readings, default: 0

      t.float :stemperature, default: 0.0
      t.float :shumidity, default: 0.0
      t.float :sbattery_charge, default: 0.0

      t.float :atemperature, default: 0.0
      t.float :ahumidity, default: 0.0
      t.float :abattery_charge, default: 0.0

      t.float :max_temperature, default: 0.0
      t.float :max_humidity, default: 0.0
      t.float :max_battery_charge, default: 0.0

      t.float :min_temperature
      t.float :min_humidity
      t.float :min_battery_charge

      t.timestamps
    end
  end
end

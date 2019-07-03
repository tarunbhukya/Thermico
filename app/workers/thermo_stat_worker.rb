class ThermoStatWorker
  include Sidekiq::Worker

  def perform(tracking_number)
    # Do something
    reading_params = Rails.cache.read(tracking_number)
    record = Reading.new(reading_params)
    record.save


    stats = ReadingStatistic.find_or_create_by(thermostat_id: record[:thermostat_id])
    stats.number_of_readings += 1
    stats.stemperature += record[:temperature]
    stats.shumidity += record[:humidity]
    stats.sbattery_charge += record[:battery_charge]

    stats.atemperature = stats.stemperature / stats.number_of_readings
    stats.ahumidity = stats.shumidity / stats.number_of_readings
    stats.abattery_charge = stats.sbattery_charge / stats.number_of_readings

    stats.max_temperature = record.temperature if record.temperature > stats.max_temperature
    stats.max_humidity = record.humidity if record.humidity > stats.max_humidity
    stats.max_battery_charge = record.battery_charge if record.battery_charge > stats.max_battery_charge

    if stats.min_temperature != nil
      stats.min_temperature = record.temperature if record.temperature < stats.max_temperature
      stats.min_humidity = record.humidity if record.humidity < stats.max_humidity
      stats.min_battery_charge = record.battery_charge if record.battery_charge < stats.max_battery_charge
    else
      stats.min_temperature = record.temperature
      stats.min_humidity = record.humidity
      stats.min_battery_charge = record.battery_charge
    end
    stats.save
    Rails.cache.delete(tracking_number)

  end
end

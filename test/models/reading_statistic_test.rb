require 'test_helper'

class ReadingStatisticTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not create if thermostat_id is missing" do
    record = ReadingStatistic.new
    assert_not record.save
  end

  test "should create a record " do
    thermostat = Thermostat.new(:household_token => "h123", :location => {:city => "hyderabad"})
    thermostat.save

    record = ReadingStatistic.new(
      thermostat_id: thermostat.id,
      number_of_readings: 1,
      stemperature: 1.5,
      shumidity: 1.5,
      sbattery_charge: 1.5,
      atemperature: 1.5,
      ahumidity: 1.5,
      abattery_charge: 1.5,
      max_temperature: 1.5,
      max_humidity: 1.5,
      max_battery_charge: 1.5,
      min_temperature: 1.5,
      min_humidity: 1.5,
      min_battery_charge: 1.5
    )

    record.save
    assert_equal 3, ReadingStatistic.count
  end
end

require 'test_helper'

class ReadingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Reading count" do
    assert_equal 2, Reading.count
  end

  test "should not create record if thermostat is missing" do
    record = Reading.new(
      :tracking_number => 1,
      :temperature => 1.5,
      :humidity => 1.5,
      :battery_charge => 1.5
    )
    assert_not record.save
  end

  test "create reading record" do
    thermostat = Thermostat.new(:household_token => "h123", :location => {:city => "hyderabad"})
    thermostat.save

    record = Reading.new(
      :thermostat_id => thermostat.id,
      :tracking_number => 3,
      :temperature => 1.5,
      :humidity => 1.5,
      :battery_charge => 1.5
    )
    record.save

    record.inspect
    assert_equal 3, Reading.count
    assert_equal 1, thermostat.readings.size
  end

  test "cannot create if tracking number is same" do
    thermostat = Thermostat.new(:household_token => "h1234", :location => {:city => "hyderabad"})
    thermostat.save

    record1 = Reading.new(
      :thermostat_id => thermostat.id,
      :tracking_number => 3,
      :temperature => 1.5,
      :humidity => 1.5,
      :battery_charge => 1.5
    )
    record1.save

    record2 = Reading.new(
      :thermostat_id => thermostat.id,
      :tracking_number => 3,
      :temperature => 1.5,
      :humidity => 1.5,
      :battery_charge => 1.5
    )
    assert_not record2.save
  end
end

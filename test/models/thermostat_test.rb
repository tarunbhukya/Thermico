require 'test_helper'

class ThermostatTest < ActiveSupport::TestCase

  test "should not save thermostats without household_token and location" do
    record = Thermostat.new
    assert_not record.save
  end

  test "thermostat count" do
    assert_equal 2, Thermostat.count
  end

  test "should create thermostat" do
    record = Thermostat.new(:household_token => "h123", :location => {:city => "hyderabad"})
    record.save
    assert_equal 3, Thermostat.count
  end

end

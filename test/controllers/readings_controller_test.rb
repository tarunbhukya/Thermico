require 'test_helper'

class ReadingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reading = readings(:one)
    @thermostat = Thermostat.create(:household_token => "h12345", :location => {:city => "hyderabad"})
    @reading3 = Reading.create(
      thermostat_id: @thermostat.id,
      tracking_number: 3,
      temperature: 1.5,
      humidity: 1.5,
      battery_charge: 1.5,
    )
    Rails.cache.write("tracking_number", 2)
  end

  test "should get index" do
    @thermostat.inspect
    get "/thermostats/#{@thermostat[:household_token]}/readings/"
    assert_response :success
  end

  test "should create reading" do
    post "/thermostats/#{@thermostat[:household_token]}/readings/", params: { reading: { battery_charge: @reading.battery_charge, humidity: @reading.humidity, temperature: @reading.temperature } }, as: :json
    assert_response 201
  end

  test "should show reading" do
    get "/thermostats/#{@thermostat[:household_token]}/readings/#{@reading3.tracking_number}", as: :json
    assert_response :success
  end

end

require 'test_helper'

class ThermostatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @thermostat = {
      household_token: "h1235",
      location: {
          "city": "city1"
        }
    }
    @thermostat3 = Thermostat.create( household_token: "h123",
    location: {
        "city": "city1"
      })
  end

  test "should get index" do
    get thermostats_url, as: :json
    assert_response :success
  end

  test "should create thermostat" do
    assert_difference('Thermostat.count') do
      post thermostats_url, params: { thermostat: { household_token: @thermostat[:household_token], location: @thermostat[:location] } }, as: :json
    end

    assert_response 201
  end

  test "should show thermostat" do
    @thermostat2 = Thermostat.new(:household_token => "h1234", :location => {:city => "hyderabad"})
    @thermostat2.save!

    get "/thermostats/#{@thermostat2.household_token}"

    # get thermostat_url(@thermostat2), as: :json
    assert_response :success
  end

  test "should update thermostat" do
    @thermostat2 = Thermostat.new(:household_token => "h1236", :location => {:city => "hyderabad"})
    @thermostat2.save!

    patch "/thermostats/#{@thermostat2.household_token}", params: { thermostat: { household_token: @thermostat[:household_token], location: @thermostat[:location] } }
    assert_response 200
  end

  test "should destroy thermostat" do
    assert_difference('Thermostat.count', -1) do
      delete "/thermostats/#{@thermostat3.household_token}"
    end

    assert_response 204
  end
end

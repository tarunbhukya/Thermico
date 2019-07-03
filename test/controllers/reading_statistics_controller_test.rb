require 'test_helper'

class ReadingStatisticsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reading_statistic = reading_statistics(:one)
  end

  # test "should get index" do
  #   get reading_statistics_url, as: :json
  #   assert_response :success
  # end
  #
  # test "should create reading_statistic" do
  #   assert_difference('ReadingStatistic.count') do
  #     post reading_statistics_url, params: { reading_statistic: { abattery_charge: @reading_statistic.abattery_charge, ahumidity: @reading_statistic.ahumidity, atemperature: @reading_statistic.atemperature, max_battery_charge: @reading_statistic.max_battery_charge, max_humidity: @reading_statistic.max_humidity, max_temperature: @reading_statistic.max_temperature, min_battery_charge: @reading_statistic.min_battery_charge, min_humidity: @reading_statistic.min_humidity, min_temperature: @reading_statistic.min_temperature, number_of_readings: @reading_statistic.number_of_readings, sbattery_charge: @reading_statistic.sbattery_charge, shumidity: @reading_statistic.shumidity, stemperature: @reading_statistic.stemperature, thermostat_id: @reading_statistic.thermostat_id } }, as: :json
  #   end
  #
  #   assert_response 201
  # end
  #
  # test "should show reading_statistic" do
  #   get reading_statistic_url(@reading_statistic), as: :json
  #   assert_response :success
  # end
  #
  # test "should update reading_statistic" do
  #   patch reading_statistic_url(@reading_statistic), params: { reading_statistic: { abattery_charge: @reading_statistic.abattery_charge, ahumidity: @reading_statistic.ahumidity, atemperature: @reading_statistic.atemperature, max_battery_charge: @reading_statistic.max_battery_charge, max_humidity: @reading_statistic.max_humidity, max_temperature: @reading_statistic.max_temperature, min_battery_charge: @reading_statistic.min_battery_charge, min_humidity: @reading_statistic.min_humidity, min_temperature: @reading_statistic.min_temperature, number_of_readings: @reading_statistic.number_of_readings, sbattery_charge: @reading_statistic.sbattery_charge, shumidity: @reading_statistic.shumidity, stemperature: @reading_statistic.stemperature, thermostat_id: @reading_statistic.thermostat_id } }, as: :json
  #   assert_response 200
  # end
  #
  # test "should destroy reading_statistic" do
  #   assert_difference('ReadingStatistic.count', -1) do
  #     delete reading_statistic_url(@reading_statistic), as: :json
  #   end
  #
  #   assert_response 204
  # end
end

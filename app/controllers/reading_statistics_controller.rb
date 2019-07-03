class ReadingStatisticsController < ApplicationController
  before_action :set_reading_statistic, only: [:show, :update, :destroy]

  # GET /reading_statistics
  def index
    @reading_statistics = ReadingStatistic.all

    render json: @reading_statistics
  end

  # GET /reading_statistics/1
  def show
    render json: @reading_statistic
  end

  # POST /reading_statistics
  def create
    @reading_statistic = ReadingStatistic.new(reading_statistic_params)

    if @reading_statistic.save
      render json: @reading_statistic, status: :created, location: @reading_statistic
    else
      render json: @reading_statistic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reading_statistics/1
  def update
    if @reading_statistic.update(reading_statistic_params)
      render json: @reading_statistic
    else
      render json: @reading_statistic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reading_statistics/1
  def destroy
    @reading_statistic.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reading_statistic
      @reading_statistic = ReadingStatistic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reading_statistic_params
      params.require(:reading_statistic).permit(:thermostat_id, :number_of_readings, :stemperature, :shumidity, :sbattery_charge, :atemperature, :ahumidity, :abattery_charge, :max_temperature, :max_humidity, :max_battery_charge, :min_temperature, :min_humidity, :min_battery_charge)
    end
end

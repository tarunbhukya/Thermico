class ReadingsController < ApplicationController
  before_action :set_thermostat
  before_action :set_reading, only: [:show]

  # GET /readings
  def index
    render json: @thermostat.readings
  end

  # GET /readings/1
  def show
    render json: @reading
  end

  # POST /readings
  def create
    tracking_number = Reading.create_record(reading_params, @thermostat[:id])
    render json: {
      "tracking_number": tracking_number
    }, status: :created
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thermostat
      @thermostat = Thermostat.find_by_household_token!(params[:thermostat_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: {
        error: e.to_s
      }, status: :not_found
    end

    def set_reading
      @reading = Rails.cache.read(params[:id])
      @reading = Reading.find_by!(tracking_number: params[:id], thermostat_id: @thermostat.id) if @reading.nil?
    rescue ActiveRecord::RecordNotFound => e
      render json: {
        error: e.to_s
      }, status: :not_found
    end

    # Only allow a trusted parameter "white list" through.
    def reading_params
      params.require(:reading).permit(:thermostat_id, :tracking_number, :temperature, :humidity, :battery_charge)
    end
end

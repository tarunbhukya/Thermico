class ThermostatsController < ApplicationController
  before_action :set_thermostat, only: [:show, :update, :destroy, :stats]

  # GET /thermostats
  def index
    @thermostats = Thermostat.all

    render json: @thermostats
  end

  # GET /thermostats/1
  def show
    render json: @thermostat
  end

  # POST /thermostats
  def create
    @thermostat = Thermostat.new(thermostat_params)

    if @thermostat.save
      render json: @thermostat, status: :created, location: @thermostat
    else
      render json: @thermostat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /thermostats/1
  def update
    if @thermostat.update(thermostat_params)
      render json: @thermostat
    else
      render json: @thermostat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /thermostats/1
  def destroy
    @thermostat.destroy
    render json: {
        "message": "Thermostat was successfully destroyed."
      }, status: :no_content
  end

  def stats
    record = ReadingStatistic.find_by(thermostat_id: @thermostat[:id])
    render :json => record, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: {
      error: e.to_s
    }, status: :not_found
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thermostat
      @thermostat = Thermostat.find_by_household_token!(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: {
        error: e.to_s
      }, status: :not_found
    end

    # Only allow a trusted parameter "white list" through.
    def thermostat_params
      params.require(:thermostat).permit(:household_token, location: [
          :house_no, :street, :city, :pincode
        ])
    end
end

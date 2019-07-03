class Reading < ApplicationRecord
  belongs_to :thermostat
  validates :thermostat_id, presence: true
  validates :tracking_number, uniqueness: true



  def self.create_record(reading_params, thermostat_id)
    # add thermostat id to the permitted params
    data = reading_params
    data[:thermostat_id] = thermostat_id

    # fetch the last tracking number of the record and increment
    tracking_number = Rails.cache.read("tracking_number")
    if tracking_number.nil?
      tracking_number = 1
    else
      tracking_number = tracking_number + 1
    end

    # store the record temporarily in redis and updated tracking number
    data[:tracking_number] = tracking_number
    Rails.cache.write("tracking_number", tracking_number).inspect
    Rails.cache.write(tracking_number, data)

    # call the worker thread to store values in database and perform computations
    ThermoStatWorker.perform_async(tracking_number)

    # return back the tracking number to the request
    tracking_number
  end

end

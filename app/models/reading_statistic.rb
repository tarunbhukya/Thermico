class ReadingStatistic < ApplicationRecord
  belongs_to :thermostat

  validates :thermostat_id, presence: true
end

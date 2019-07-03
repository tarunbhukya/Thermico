class Thermostat < ApplicationRecord
  has_many :readings
  has_one :reading_statistic

  validates :household_token, uniqueness: true
  validates :household_token, presence: true
  validates :location, presence: true

end

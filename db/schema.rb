# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_07_03_184032) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reading_statistics", force: :cascade do |t|
    t.integer "thermostat_id"
    t.integer "number_of_readings", default: 0
    t.float "stemperature", default: 0.0
    t.float "shumidity", default: 0.0
    t.float "sbattery_charge", default: 0.0
    t.float "atemperature", default: 0.0
    t.float "ahumidity", default: 0.0
    t.float "abattery_charge", default: 0.0
    t.float "max_temperature", default: 0.0
    t.float "max_humidity", default: 0.0
    t.float "max_battery_charge", default: 0.0
    t.float "min_temperature"
    t.float "min_humidity"
    t.float "min_battery_charge"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "readings", force: :cascade do |t|
    t.integer "thermostat_id"
    t.integer "tracking_number"
    t.float "temperature", default: 0.0
    t.float "humidity", default: 0.0
    t.float "battery_charge", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["thermostat_id"], name: "index_readings_on_thermostat_id"
    t.index ["tracking_number"], name: "index_readings_on_tracking_number"
  end

  create_table "thermostats", force: :cascade do |t|
    t.text "household_token", null: false
    t.jsonb "location", default: {}, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["household_token"], name: "index_thermostats_on_household_token"
    t.index ["location"], name: "index_thermostats_on_location"
  end

end

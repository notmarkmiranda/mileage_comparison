# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170811233433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "logs", force: :cascade do |t|
    t.bigint "user_id"
    t.decimal "distance"
    t.integer "travel_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "notes"
    t.integer "strava_id"
    t.string "name"
    t.datetime "activity_date"
    t.bigint "odometer_reading_id"
    t.index ["odometer_reading_id"], name: "index_logs_on_odometer_reading_id"
    t.index ["user_id"], name: "index_logs_on_user_id"
  end

  create_table "odometer_readings", force: :cascade do |t|
    t.date "date"
    t.integer "mileage"
    t.string "notes"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_odometer_readings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "strava_id"
    t.string "access_token"
    t.string "first_name"
    t.string "last_name"
    t.string "profile_picture"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "dashboard_token"
    t.index ["dashboard_token"], name: "index_users_on_dashboard_token", unique: true
  end

  add_foreign_key "logs", "odometer_readings"
  add_foreign_key "logs", "users"
  add_foreign_key "odometer_readings", "users"
end

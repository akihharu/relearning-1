# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2026_06_09_144706) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.bigint "participant_id", null: false
    t.bigint "candidate_date_id", null: false
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_date_id"], name: "index_attendances_on_candidate_date_id"
    t.index ["participant_id"], name: "index_attendances_on_participant_id"
  end

  create_table "candidate_dates", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_candidate_dates_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.string "name"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_participants_on_event_id"
  end

  add_foreign_key "attendances", "candidate_dates"
  add_foreign_key "attendances", "participants"
  add_foreign_key "candidate_dates", "events"
  add_foreign_key "participants", "events"
end

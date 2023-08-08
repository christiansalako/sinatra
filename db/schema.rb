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

ActiveRecord::Schema[7.0].define(version: 2023_08_08_135525) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entries", force: :cascade do |t|
    t.string "provider_uid"
    t.string "survey_url"
    t.string "provider_status"
    t.integer "user_income"
    t.integer "listing_index"
    t.integer "listing_score"
    t.float "survey_score"
    t.float "starting_score"
    t.string "provider_cost"
    t.integer "length_in_minutes"
    t.integer "indicative_cpi"
    t.text "listing_stats"
    t.string "qurated_revenue_currency"
    t.integer "qurated_revenue"
    t.integer "panel_provider_income"
    t.bigint "session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_entries_on_session_id", unique: true
  end

  create_table "entry_archives", force: :cascade do |t|
    t.string "provider_uid"
    t.string "survey_url"
    t.string "provider_status"
    t.integer "user_income"
    t.integer "listing_index"
    t.integer "listing_score"
    t.float "survey_score"
    t.float "starting_score"
    t.string "provider_cost"
    t.integer "length_in_minutes"
    t.integer "indicative_cpi"
    t.text "listing_stats"
    t.string "qurated_revenue_currency"
    t.integer "qurated_revenue"
    t.integer "panel_provider_income"
    t.bigint "session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_entry_archives_on_session_id", unique: true
  end

  create_table "entry_state_archives", force: :cascade do |t|
    t.string "status"
    t.string "status_description"
    t.bigint "entry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entry_id"], name: "index_entry_state_archives_on_entry_id", unique: true
  end

  create_table "entry_states", force: :cascade do |t|
    t.string "status"
    t.string "status_description"
    t.bigint "entry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entry_id"], name: "index_entry_states_on_entry_id", unique: true
  end

  create_table "session_archives", force: :cascade do |t|
    t.string "device"
    t.integer "displayed_reward"
    t.datetime "finished_at"
    t.string "ip_address"
    t.boolean "paid_on_rejection"
    t.datetime "started_at"
    t.string "session_status"
    t.jsonb "tracking_params"
    t.string "user_agent"
    t.boolean "user_income_on_rejection"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "panelist_id"
    t.string "panel"
    t.string "country_code"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "device"
    t.integer "displayed_reward"
    t.datetime "finished_at"
    t.string "ip_address"
    t.boolean "paid_on_rejection"
    t.datetime "started_at"
    t.string "session_status"
    t.jsonb "tracking_params"
    t.string "user_agent"
    t.boolean "user_income_on_rejection"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "panelist_id"
    t.string "panel"
    t.string "country_code"
  end

  add_foreign_key "entries", "sessions"
  add_foreign_key "entry_archives", "sessions"
  add_foreign_key "entry_state_archives", "entries"
  add_foreign_key "entry_states", "entries"
end

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

ActiveRecord::Schema.define(version: 2021_10_31_195125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.date "date"
    t.bigint "track_id", null: false
    t.bigint "league_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["league_id"], name: "index_events_on_league_id"
    t.index ["track_id"], name: "index_events_on_track_id"
  end

  create_table "extra_points", force: :cascade do |t|
    t.text "description"
    t.integer "points_given"
    t.bigint "user_event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_event_id"], name: "index_extra_points_on_user_event_id"
  end

  create_table "league_points_systems", force: :cascade do |t|
    t.bigint "league_id", null: false
    t.bigint "points_system_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["league_id"], name: "index_league_points_systems_on_league_id"
    t.index ["points_system_id"], name: "index_league_points_systems_on_points_system_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "created_by"
  end

  create_table "points_systems", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "positions_tables", force: :cascade do |t|
    t.string "position"
    t.integer "points"
    t.bigint "points_system_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["points_system_id"], name: "index_positions_tables_on_points_system_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sanctions", force: :cascade do |t|
    t.text "description"
    t.integer "points_taken"
    t.string "videolink"
    t.bigint "user_event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_event_id"], name: "index_sanctions_on_user_event_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_events", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.integer "points"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role"
    t.index ["event_id"], name: "index_user_events_on_event_id"
    t.index ["user_id", "event_id"], name: "index_user_events_on_user_id_and_event_id", unique: true
    t.index ["user_id"], name: "index_user_events_on_user_id"
  end

  create_table "user_leagues", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "league_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "points"
    t.index ["league_id"], name: "index_user_leagues_on_league_id"
    t.index ["user_id", "league_id"], name: "index_user_leagues_on_user_id_and_league_id", unique: true
    t.index ["user_id"], name: "index_user_leagues_on_user_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "last_name"
    t.string "drivers_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "events", "leagues"
  add_foreign_key "events", "tracks"
  add_foreign_key "extra_points", "user_events"
  add_foreign_key "league_points_systems", "leagues"
  add_foreign_key "league_points_systems", "points_systems"
  add_foreign_key "positions_tables", "points_systems"
  add_foreign_key "sanctions", "user_events"
  add_foreign_key "user_events", "events"
  add_foreign_key "user_events", "users"
  add_foreign_key "user_leagues", "leagues"
  add_foreign_key "user_leagues", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end

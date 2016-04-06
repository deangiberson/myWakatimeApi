# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160405052058) do

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
  end

  add_index "api_keys", ["user_id"], name: "index_api_keys_on_user_id"

  create_table "durations", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "project"
    t.decimal  "time"
    t.integer  "duration"
    t.string   "branch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "durations", ["user_id"], name: "index_durations_on_user_id"

  create_table "heartbeats", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "entity"
    t.string   "entity_type"
    t.decimal  "time"
    t.string   "project"
    t.string   "branch"
    t.string   "language"
    t.string   "dependencies"
    t.integer  "lines"
    t.integer  "lineno"
    t.integer  "cursorpos"
    t.boolean  "is_write"
    t.boolean  "is_debugging"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "heartbeats", ["user_id"], name: "index_heartbeats_on_user_id"

  create_table "languages", force: :cascade do |t|
    t.integer  "running_total_id"
    t.string   "name"
    t.integer  "total_seconds"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "languages", ["running_total_id"], name: "index_languages_on_running_total_id"

  create_table "leaders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "leaders", ["user_id"], name: "index_leaders_on_user_id"

  create_table "profiles", force: :cascade do |t|
    t.boolean "logged_time_public"
    t.boolean "languages_used_public"
    t.boolean "email_public"
    t.boolean "photo_public"
  end

  create_table "running_totals", force: :cascade do |t|
    t.integer  "leader_id"
    t.integer  "total_seconds"
    t.integer  "daily_average"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "running_totals", ["leader_id"], name: "index_running_totals_on_leader_id"

  create_table "stat_best_days", force: :cascade do |t|
    t.integer  "stat_id"
    t.string   "date"
    t.integer  "total_seconds"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "stat_best_days", ["stat_id"], name: "index_stat_best_days_on_stat_id"

  create_table "stat_editors", force: :cascade do |t|
    t.integer  "stat_id"
    t.string   "name"
    t.integer  "total_seconds"
    t.float    "percent"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "stat_editors", ["stat_id"], name: "index_stat_editors_on_stat_id"

  create_table "stat_languages", force: :cascade do |t|
    t.integer  "stat_id"
    t.string   "name"
    t.integer  "total_seconds"
    t.float    "percent"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "stat_languages", ["stat_id"], name: "index_stat_languages_on_stat_id"

  create_table "stat_operating_systems", force: :cascade do |t|
    t.integer  "stat_id"
    t.string   "name"
    t.integer  "total_seconds"
    t.float    "percent"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "stat_operating_systems", ["stat_id"], name: "index_stat_operating_systems_on_stat_id"

  create_table "stat_projects", force: :cascade do |t|
    t.integer  "stat_id"
    t.string   "name"
    t.integer  "total_seconds"
    t.float    "percent"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "stat_projects", ["stat_id"], name: "index_stat_projects_on_stat_id"

  create_table "stats", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "range"
    t.integer  "holidays"
    t.string   "status"
    t.boolean  "is_already_updating"
    t.boolean  "is_stuck"
    t.boolean  "is_up_to_date"
    t.integer  "start"
    t.integer  "end"
    t.string   "timezone"
    t.integer  "timeout"
    t.boolean  "writes_only"
    t.integer  "total_seconds"
    t.integer  "daily_average"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "stats", ["user_id"], name: "index_stats_on_user_id"

  create_table "user_agents", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "user_agent"
    t.string   "editor"
    t.string   "version"
    t.string   "os"
    t.datetime "last_seen"
  end

  add_index "user_agents", ["user_id"], name: "index_user_agents_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "user_id"
    t.string   "username"
    t.string   "email"
    t.string   "timezone"
    t.integer  "plan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "profile_id"
  end

  add_index "users", ["profile_id"], name: "index_users_on_profile_id"

end

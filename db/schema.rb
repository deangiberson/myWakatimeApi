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

ActiveRecord::Schema.define(version: 20160330041141) do

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

  create_table "profiles", force: :cascade do |t|
    t.boolean "logged_time_public"
    t.boolean "languages_used_public"
    t.boolean "email_public"
    t.boolean "photo_public"
  end

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

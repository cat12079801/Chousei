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

ActiveRecord::Schema.define(version: 20150221032410) do

  create_table "opinions", force: :cascade do |t|
    t.integer  "plan_id",    limit: 4,     null: false
    t.string   "cookie",     limit: 255,   null: false
    t.string   "password",   limit: 255
    t.string   "name",       limit: 255,   null: false
    t.text     "opinion",    limit: 65535, null: false
    t.text     "note",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "plans", force: :cascade do |t|
    t.string   "cookie",       limit: 255,   null: false
    t.string   "password",     limit: 255
    t.string   "title",        limit: 255,   null: false
    t.text     "explanation",  limit: 65535
    t.string   "original_url", limit: 255,   null: false
    t.date     "day_start",                  null: false
    t.date     "day_end",                    null: false
    t.text     "day_out",      limit: 65535
    t.integer  "day_number",   limit: 4,     null: false
    t.boolean  "enable_time",  limit: 1,     null: false
    t.time     "time_start"
    t.time     "time_end"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end

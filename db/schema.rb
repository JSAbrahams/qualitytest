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

ActiveRecord::Schema.define(version: 20170318152106) do

  create_table "campaign_sets", force: true do |t|
    t.string  "image_viewtimes_id"
    t.integer "started"
    t.integer "completed"
  end

  create_table "image_viewtimes", force: true do |t|
    t.integer "image_id",    null: false
    t.integer "viewtime_id", null: false
  end

  create_table "images", force: true do |t|
    t.text "filepath"
  end

  create_table "scores", force: true do |t|
    t.integer "user_id",     null: false
    t.integer "img_id",      null: false
    t.integer "viewtime",    null: false
    t.decimal "distortion"
    t.integer "quality"
    t.text    "semantic"
    t.text    "detail"
    t.text    "description"
    t.text    "start_time"
    t.text    "end_time"
  end

  create_table "users", force: true do |t|
    t.integer  "campaign_id"
    t.string   "gender"
    t.text     "country"
    t.string   "age"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "validation_1"
    t.integer  "validation_2"
  end

  create_table "viewtimes", force: true do |t|
    t.integer "viewtime", null: false
  end

  add_index "viewtimes", ["id", "viewtime"], name: "sqlite_autoindex_viewtimes_1", unique: true

end

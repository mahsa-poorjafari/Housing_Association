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

ActiveRecord::Schema.define(version: 20140408084358) do

  create_table "cooperatives", force: true do |t|
    t.string   "name"
    t.string   "managment_name"
    t.string   "board_Chairman_name"
    t.text     "address"
    t.string   "phone"
    t.text     "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "informs", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "number_visit"
    t.boolean  "important"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "managements", force: true do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "post"
    t.text     "Work_Experience"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "subject"
    t.text     "text"
    t.boolean  "visited"
    t.string   "user_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "phone"
  end

  create_table "pages", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "description"
    t.integer  "project_id"
  end

  create_table "projects", force: true do |t|
    t.string   "title"
    t.text     "address"
    t.text     "description"
    t.string   "Area"
    t.integer  "unit"
    t.boolean  "Status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

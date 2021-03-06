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

ActiveRecord::Schema.define(version: 20150423091520) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
  end

  create_table "circulars", force: true do |t|
    t.string   "title"
    t.integer  "project_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
  end

  create_table "comment_complaints", force: true do |t|
    t.integer  "user_id"
    t.integer  "complaint_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_name"
    t.string   "user_email"
  end

  create_table "complaints", force: true do |t|
    t.text     "complaint_text"
    t.text     "complaint_answer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subject"
    t.string   "user_email"
    t.string   "user_phone"
    t.boolean  "inspector_visited"
    t.boolean  "display",           default: false
    t.boolean  "admin_visited",     default: false
  end

  create_table "contacts", force: true do |t|
    t.string   "preson_name"
    t.string   "company_name"
    t.string   "phone"
    t.string   "fax"
    t.text     "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cooperative_id"
    t.string   "email"
  end

  create_table "contacts_letters", id: false, force: true do |t|
    t.integer "contact_id"
    t.integer "letter_id"
  end

  create_table "cooperatives", force: true do |t|
    t.string   "name"
    t.string   "managment_name"
    t.string   "board_Chairman_name"
    t.text     "address"
    t.string   "phone"
    t.text     "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email_company"
    t.string   "fax"
  end

  create_table "educations", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "impressions", force: true do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", length: {"impressionable_type"=>nil, "message"=>255, "impressionable_id"=>nil}, using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "informs", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "number_visit",       default: 0
    t.boolean  "important"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "project_id"
    t.boolean  "immediate"
  end

  create_table "letter_templates", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "letters", force: true do |t|
    t.string   "letter_type"
    t.string   "summary"
    t.date     "sent_date"
    t.date     "received_date"
    t.integer  "sender_id"
    t.text     "content"
    t.string   "attachment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "letter_number"
    t.string   "scan_file_file_name"
    t.string   "scan_file_content_type"
    t.integer  "scan_file_file_size"
    t.datetime "scan_file_updated_at"
    t.string   "senderpreson_name"
    t.string   "sendercompany_name"
    t.string   "received_letter_number"
    t.string   "ehteramn"
  end

  create_table "links", force: true do |t|
    t.string   "title"
    t.string   "web_site"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "member_posts", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: true do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "mobile"
    t.text     "address"
    t.string   "postal_code"
    t.string   "father_name"
    t.date     "birthdate"
    t.string   "national_id_card"
    t.string   "identify_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "cooperative_id"
    t.integer  "member_post_id"
    t.boolean  "deactive"
    t.string   "paid_member"
  end

  create_table "messages", force: true do |t|
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

  create_table "partnerships", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "father_name"
    t.date     "birthdate"
    t.boolean  "gender"
    t.string   "phone_number"
    t.string   "mobile"
    t.boolean  "farhangi"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "address"
    t.text     "description"
  end

  create_table "pay_limits", force: true do |t|
    t.string   "amount"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "partnership_id"
    t.string   "tracking_code"
    t.string   "accept_description"
    t.boolean  "accept",             default: false
    t.boolean  "visited",            default: false
  end

  create_table "payments", force: true do |t|
    t.float    "amount"
    t.string   "bank_draft_no"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "project_id"
  end

  create_table "pdf_forms", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "petitions", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.integer  "inform_id"
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
    t.string   "land_area"
    t.string   "floor"
    t.string   "block"
    t.integer  "start_year"
    t.integer  "finish_year"
  end

  create_table "projects_users", force: true do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "send_links", force: true do |t|
    t.string   "sender_email"
    t.string   "receiver_email"
    t.string   "current_link"
    t.text     "text"
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "simple_captcha_data", force: true do |t|
    t.string   "key",        limit: 40
    t.string   "value",      limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "simple_captcha_data", ["key"], name: "idx_key", using: :btree

  create_table "slides", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "upload_files", force: true do |t|
    t.string   "description"
    t.integer  "cooperative_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "mobile"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.text     "address"
    t.string   "national_code"
    t.integer  "role_id"
    t.string   "birthdate"
    t.integer  "cooperative_code"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "views", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "views", ["email"], name: "index_views_on_email", unique: true, using: :btree
  add_index "views", ["reset_password_token"], name: "index_views_on_reset_password_token", unique: true, using: :btree

  create_table "visits", force: true do |t|
    t.string   "visit_token"
    t.string   "visitor_token"
    t.string   "ip"
    t.text     "user_agent"
    t.text     "referrer"
    t.text     "landing_page"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "referring_domain"
    t.string   "search_keyword"
    t.string   "browser"
    t.string   "os"
    t.string   "device_type"
    t.string   "country"
    t.string   "region"
    t.string   "city"
    t.string   "utm_source"
    t.string   "utm_medium"
    t.string   "utm_term"
    t.string   "utm_content"
    t.string   "utm_campaign"
    t.datetime "created_at"
  end

  add_index "visits", ["user_id", "user_type"], name: "index_visits_on_user_id_and_user_type", using: :btree
  add_index "visits", ["visit_token"], name: "index_visits_on_visit_token", unique: true, using: :btree

end

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

ActiveRecord::Schema.define(version: 20151203183440) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bikes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "category"
    t.string   "size"
    t.string   "title"
    t.text     "description"
    t.integer  "price_hour"
    t.integer  "price_day"
    t.integer  "price_week"
    t.integer  "price_month"
    t.integer  "price_year"
    t.string   "country"
    t.string   "city"
    t.string   "address"
    t.string   "zipcode"
    t.string   "state"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.boolean  "is_lock"
    t.boolean  "is_helmet"
    t.boolean  "is_lights"
    t.boolean  "is_bell"
    t.boolean  "is_reflectors"
    t.boolean  "is_baskets"
    t.boolean  "is_trailers"
    t.integer  "speed"
    t.integer  "chain_wheel"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "bikes", ["user_id"], name: "index_bikes_on_user_id", using: :btree

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "opened",          default: false
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.integer  "bike_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "photos", ["bike_id"], name: "index_photos_on_bike_id", using: :btree

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "bike_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "price"
    t.integer  "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reservations", ["bike_id"], name: "index_reservations_on_bike_id", using: :btree
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "fullname"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "bikes", "users"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "photos", "bikes"
  add_foreign_key "reservations", "bikes"
  add_foreign_key "reservations", "users"
end

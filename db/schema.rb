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

ActiveRecord::Schema.define(version: 20161005100417) do

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "company_id"
    t.index ["company_id"], name: "index_clients_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expeditions", force: :cascade do |t|
    t.integer  "origin_location_id"
    t.integer  "destination_location_id"
    t.string   "sending_type"
    t.integer  "weight"
    t.string   "state"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.date     "date"
    t.integer  "client_id"
    t.string   "geolocation"
    t.index ["client_id"], name: "index_expeditions_on_client_id"
    t.index ["destination_location_id"], name: "index_expeditions_on_destination_location_id"
    t.index ["origin_location_id"], name: "index_expeditions_on_origin_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "internal_code"
    t.string   "name"
    t.string   "direction"
    t.string   "postal_code"
    t.time     "hour_in"
    t.time     "hour_out"
    t.string   "contact"
    t.integer  "route"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["client_id"], name: "index_locations_on_client_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "role"
    t.integer  "company_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

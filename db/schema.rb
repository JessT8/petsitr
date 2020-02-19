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

ActiveRecord::Schema.define(version: 2020_02_18_102208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "sitters", force: :cascade do |t|
    t.bigint "user_id"
    t.string "phone"
    t.text "location"
    t.string "price"
    t.text "description"
    t.boolean "is_visible"
    t.text "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sitters_on_user_id"
  end

  create_table "timeslots", force: :cascade do |t|
    t.bigint "sitter_id"
    t.date "available_start_date"
    t.date "available_end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sitter_id"], name: "index_timeslots_on_sitter_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "sitters", "users"
end

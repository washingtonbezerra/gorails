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

ActiveRecord::Schema.define(version: 20160312201456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.string   "origin_type"
    t.boolean  "situation"
    t.integer  "origin_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "file"
  end

  add_index "attachments", ["origin_type", "origin_id"], name: "index_attachments_on_origin_type_and_origin_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "start_at"
    t.text     "local"
    t.integer  "participants_limit"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.datetime "end_at"
  end

  create_table "gifts", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "event_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "photo"
  end

  add_index "gifts", ["event_id"], name: "index_gifts_on_event_id", using: :btree

  create_table "link_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.integer  "link_category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.text     "description"
  end

  add_index "links", ["link_category_id"], name: "index_links_on_link_category_id", using: :btree

  create_table "partners", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.integer  "order"
    t.boolean  "site"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "category"
    t.string   "logo"
  end

  add_index "partners", ["event_id"], name: "index_partners_on_event_id", using: :btree

  create_table "registrations", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "cpf"
    t.string   "nickname"
    t.string   "provider"
    t.string   "uid"
    t.string   "avatar"
    t.string   "cover_photo"
    t.text     "bio"
    t.string   "job_title"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "gifts", "events"
  add_foreign_key "links", "link_categories"
  add_foreign_key "partners", "events"
end

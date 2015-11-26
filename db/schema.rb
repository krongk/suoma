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

ActiveRecord::Schema.define(version: 20151124145463) do

  create_table "agencies", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "en_name",    limit: 255
    t.string   "address",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "agency_contacts", force: :cascade do |t|
    t.integer  "agency_id",  limit: 4
    t.string   "name",       limit: 255
    t.string   "mobile",     limit: 255
    t.boolean  "is_admin"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "agency_contacts", ["agency_id"], name: "index_agency_contacts_on_agency_id", using: :btree

  create_table "guides", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "mobile",         limit: 255
    t.string   "license_number", limit: 255
    t.string   "qq",             limit: 255
    t.string   "wechat",         limit: 255
    t.boolean  "is_published"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",        limit: 4
    t.integer  "taggable_id",   limit: 4
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id",     limit: 4
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count", limit: 4,   default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "traveller_groups", force: :cascade do |t|
    t.integer  "trip_id",           limit: 4
    t.integer  "agency_contact_id", limit: 4
    t.date     "trav_date"
    t.decimal  "price_receivable",            precision: 10
    t.decimal  "price_received",              precision: 10
    t.decimal  "price_for_sb",                precision: 10
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "traveller_groups", ["agency_contact_id"], name: "index_traveller_groups_on_agency_contact_id", using: :btree
  add_index "traveller_groups", ["trip_id"], name: "index_traveller_groups_on_trip_id", using: :btree

  create_table "travellers", force: :cascade do |t|
    t.integer  "traveller_group_id", limit: 4
    t.string   "name",               limit: 255
    t.string   "mobile",             limit: 255
    t.string   "id_card",            limit: 255
    t.boolean  "is_kid"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "travellers", ["traveller_group_id"], name: "index_travellers_on_traveller_group_id", using: :btree

  create_table "trips", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.boolean  "is_published"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
    t.integer  "role",                   limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vouchers", force: :cascade do |t|
    t.integer  "traveller_group_id", limit: 4
    t.decimal  "price",                          precision: 10
    t.string   "image",              limit: 255
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "vouchers", ["traveller_group_id"], name: "index_vouchers_on_traveller_group_id", using: :btree

  add_foreign_key "agency_contacts", "agencies"
  add_foreign_key "traveller_groups", "agency_contacts"
  add_foreign_key "traveller_groups", "trips"
  add_foreign_key "travellers", "traveller_groups"
  add_foreign_key "vouchers", "traveller_groups"
end

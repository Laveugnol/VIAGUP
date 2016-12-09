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

ActiveRecord::Schema.define(version: 20161209145422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "bouquet_shares", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "bouquet_id"
    t.integer  "viager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bouquet_id"], name: "index_bouquet_shares_on_bouquet_id", using: :btree
    t.index ["user_id"], name: "index_bouquet_shares_on_user_id", using: :btree
    t.index ["viager_id"], name: "index_bouquet_shares_on_viager_id", using: :btree
  end

  create_table "bouquets", force: :cascade do |t|
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "olds", force: :cascade do |t|
    t.integer  "age"
    t.integer  "lifespan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "first_name"
    t.string   "last_name"
  end

  create_table "rente_shares", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "rente_id"
    t.integer  "viager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rente_id"], name: "index_rente_shares_on_rente_id", using: :btree
    t.index ["user_id"], name: "index_rente_shares_on_user_id", using: :btree
    t.index ["viager_id"], name: "index_rente_shares_on_viager_id", using: :btree
  end

  create_table "rentes", force: :cascade do |t|
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.datetime "date_birth"
    t.string   "place_birth"
    t.string   "nationality"
    t.string   "country"
    t.string   "address"
    t.string   "city"
    t.string   "zip_code"
    t.string   "phone"
    t.boolean  "admin",                  default: false
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "viagers", force: :cascade do |t|
    t.string   "address"
    t.string   "city"
    t.string   "zip_code"
    t.string   "country"
    t.integer  "old_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "photo"
    t.integer  "bouquet"
    t.integer  "rente"
    t.integer  "horizon"
    t.float    "tri"
    t.float    "latitude"
    t.float    "longitude"
    t.index ["old_id"], name: "index_viagers_on_old_id", using: :btree
  end

  add_foreign_key "bouquet_shares", "bouquets"
  add_foreign_key "bouquet_shares", "users"
  add_foreign_key "bouquet_shares", "viagers"
  add_foreign_key "rente_shares", "rentes"
  add_foreign_key "rente_shares", "users"
  add_foreign_key "rente_shares", "viagers"
  add_foreign_key "viagers", "olds"
end

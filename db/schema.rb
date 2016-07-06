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

ActiveRecord::Schema.define(version: 20160706202705) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string  "name"
    t.integer "kind"
    t.string  "slug"
  end

  create_table "categories_items", id: false, force: :cascade do |t|
    t.integer "item_id",     null: false
    t.integer "category_id", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string  "name"
    t.string  "description"
    t.decimal "price"
    t.string  "image"
    t.integer "status",      default: 0
    t.integer "vendor_id"
    t.integer "category_id"
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id", using: :btree
  add_index "items", ["vendor_id"], name: "index_items_on_vendor_id", using: :btree

  create_table "order_items", id: false, force: :cascade do |t|
    t.integer "order_id",  null: false
    t.integer "item_id",   null: false
    t.string  "quantity"
    t.decimal "subtotal"
    t.integer "vendor_id"
  end

  add_index "order_items", ["item_id"], name: "index_order_items_on_item_id", using: :btree
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["vendor_id"], name: "index_order_items_on_vendor_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "status",      default: 0
    t.datetime "finished_at"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.string   "author_name"
    t.text     "body"
    t.integer  "vendor_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "reviews", ["vendor_id"], name: "index_reviews_on_vendor_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "role",            default: 0
    t.string   "email"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "vendor_id"
  end

  add_index "users", ["vendor_id"], name: "index_users_on_vendor_id", using: :btree

  create_table "vendors", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "city"
    t.string   "state"
    t.string   "status",      default: "pending"
    t.string   "slug"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "category_id"
  end

  add_index "vendors", ["category_id"], name: "index_vendors_on_category_id", using: :btree

  add_foreign_key "items", "categories"
  add_foreign_key "items", "vendors"
  add_foreign_key "order_items", "vendors"
  add_foreign_key "orders", "users"
  add_foreign_key "reviews", "vendors"
  add_foreign_key "users", "vendors"
  add_foreign_key "vendors", "categories"
end

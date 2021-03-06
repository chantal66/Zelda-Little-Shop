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

ActiveRecord::Schema.define(version: 20170601223404) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "price"
    t.string "slug"
    t.string "show"
    t.boolean "status", default: true
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["slug"], name: "index_items_on_slug", unique: true
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.string "status", default: "Ordered"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "orders_items", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "item_id"
    t.integer "quantity"
    t.index ["item_id"], name: "index_orders_items_on_item_id"
    t.index ["order_id"], name: "index_orders_items_on_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "role", default: 0
    t.string "location", default: "Hyrule"
  end

  add_foreign_key "items", "categories"
  add_foreign_key "orders", "users"
  add_foreign_key "orders_items", "items"
  add_foreign_key "orders_items", "orders"
end

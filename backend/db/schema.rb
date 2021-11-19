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

ActiveRecord::Schema.define(version: 2021_11_17_014458) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.integer "code"
    t.string "description"
    t.string "nature"
    t.string "signal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_categories_on_code", unique: true
  end

  create_table "operations", force: :cascade do |t|
    t.integer "categorycode"
    t.datetime "occurrencetime"
    t.float "value"
    t.bigint "store_id", null: false
    t.bigint "recipient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_operations_on_recipient_id"
    t.index ["store_id"], name: "index_operations_on_store_id"
  end

  create_table "recipients", force: :cascade do |t|
    t.string "individualregistration"
    t.string "card"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "storename"
    t.string "storeowner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "operations", "categories", column: "categorycode", primary_key: "code"
  add_foreign_key "operations", "recipients"
  add_foreign_key "operations", "stores"
end

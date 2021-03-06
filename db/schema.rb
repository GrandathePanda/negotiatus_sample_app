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

ActiveRecord::Schema.define(version: 2018_05_16_152033) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "shipments", primary_key: "order_number", id: :string, force: :cascade do |t|
    t.string "tracking_identifier"
    t.string "address", null: false
    t.boolean "delivered", default: false, null: false
    t.date "ordered_at", null: false
    t.bigint "vendor_id"
    t.datetime "delivery_time"
    t.index ["order_number"], name: "index_shipments_on_order_number", unique: true
    t.index ["vendor_id"], name: "index_shipments_on_vendor_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name", null: false
    t.integer "average_delivery_time", default: 0, null: false
    t.index ["name"], name: "index_vendors_on_name", unique: true
  end

  add_foreign_key "shipments", "vendors"
end

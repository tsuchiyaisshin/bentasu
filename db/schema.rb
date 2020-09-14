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

ActiveRecord::Schema.define(version: 20190110075040) do

  create_table "allergies", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "allergy_dishes", force: :cascade do |t|
    t.integer  "allergy_id"
    t.integer  "dish_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "allergy_dishes", ["allergy_id"], name: "index_allergy_dishes_on_allergy_id"
  add_index "allergy_dishes", ["dish_id"], name: "index_allergy_dishes_on_dish_id"

  create_table "box_dishes", force: :cascade do |t|
    t.integer  "box_id",     null: false
    t.integer  "dish_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "box_dishes", ["box_id"], name: "index_box_dishes_on_box_id"
  add_index "box_dishes", ["dish_id"], name: "index_box_dishes_on_dish_id"

  create_table "box_kinds", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "capacity",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "boxes", force: :cascade do |t|
    t.integer  "box_kind_id", null: false
    t.integer  "order_id"
    t.integer  "rice",        null: false
    t.integer  "number",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boxes", ["box_kind_id"], name: "index_boxes_on_box_kind_id"
  add_index "boxes", ["order_id"], name: "index_boxes_on_order_id"

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "telephone"
    t.string   "mail_address"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "hashed_password"
  end

  create_table "dish_images", force: :cascade do |t|
    t.integer  "dish_id",      null: false
    t.binary   "data"
    t.string   "content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dish_images", ["dish_id"], name: "index_dish_images_on_dish_id"

  create_table "dishes", force: :cascade do |t|
    t.string   "name",                       null: false
    t.integer  "price",                      null: false
    t.integer  "calorie",                    null: false
    t.integer  "category",                   null: false
    t.boolean  "potential",  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id",                 null: false
    t.boolean  "stasu",       default: false, null: false
    t.datetime "time",                        null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id"

  create_table "sale_manegements", force: :cascade do |t|
    t.integer  "dish_id",                    null: false
    t.integer  "planned_number", default: 0, null: false
    t.integer  "made_number",    default: 0, null: false
    t.integer  "sold_number",    default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sale_manegements", ["dish_id"], name: "index_sale_manegements_on_dish_id"

  create_table "workers", force: :cascade do |t|
    t.string   "name"
    t.boolean  "admin",           default: false
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "hashed_password"
  end

end

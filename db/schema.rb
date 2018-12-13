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

ActiveRecord::Schema.define(version: 2018_12_13_151507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "districts", force: :cascade do |t|
    t.bigint "province_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_districts_on_province_id"
  end

  create_table "images", force: :cascade do |t|
    t.bigint "province_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_images_on_province_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.bigint "product_id"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_pictures_on_product_id"
  end

  create_table "product_invest_details", force: :cascade do |t|
    t.bigint "product_invest_id"
    t.string "name"
    t.integer "test"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_invest_id"], name: "index_product_invest_details_on_product_invest_id"
  end

  create_table "product_invests", force: :cascade do |t|
    t.bigint "product_id"
    t.string "name"
    t.integer "slot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_invests_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "producttype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subdistricts", force: :cascade do |t|
    t.bigint "district_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["district_id"], name: "index_subdistricts_on_district_id"
  end

  add_foreign_key "districts", "provinces"
  add_foreign_key "images", "provinces"
  add_foreign_key "pictures", "products"
  add_foreign_key "product_invest_details", "product_invests"
  add_foreign_key "product_invests", "products"
  add_foreign_key "subdistricts", "districts"
end

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

ActiveRecord::Schema.define(version: 20200109084801) do

  create_table "adresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",      null: false
    t.integer  "postal_code",  null: false
    t.integer  "prefecture",   null: false
    t.string   "city",         null: false
    t.string   "house_number", null: false
    t.string   "building"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "brand_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "brand_id",    null: false
    t.integer  "category_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "brand"
    t.integer  "brand_category_id", null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "category_L"
    t.string   "category_M"
    t.string   "category_S"
    t.integer  "brand_category_id", null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "product_id",               null: false
    t.integer  "user_id",                  null: false
    t.text     "content",    limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "goods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",    null: false
    t.integer  "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "image"
    t.integer  "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                           null: false
    t.text     "content",          limit: 65535, null: false
    t.integer  "category_id",                    null: false
    t.string   "size"
    t.integer  "brand_id"
    t.integer  "status",                         null: false
    t.integer  "delivery_charge",                null: false
    t.integer  "shipping_method",                null: false
    t.integer  "date_of_shipment",               null: false
    t.integer  "price",                          null: false
    t.integer  "user_id",                        null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                        null: false
    t.string   "name_kana",                                   null: false
    t.string   "mail_address",                                null: false
    t.string   "password",                                    null: false
    t.integer  "tel",                                         null: false
    t.date     "birthday",                                    null: false
    t.text     "self_introduction", limit: 65535
    t.integer  "point",                           default: 0
    t.integer  "proceed",                         default: 0
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

end

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

ActiveRecord::Schema.define(version: 2019_11_04_114338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "peso_minimo"
    t.decimal "peso_maximo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "peso_liquido"
    t.bigint "line_id"
    t.index ["line_id"], name: "index_products_on_line_id"
  end

  create_table "samplings", force: :cascade do |t|
    t.bigint "product_id"
    t.date "data"
    t.decimal "peso"
    t.string "lote"
    t.integer "quantidade_produzida"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_samplings_on_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weighings", force: :cascade do |t|
    t.decimal "peso"
    t.bigint "sampling_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sampling_id"], name: "index_weighings_on_sampling_id"
  end

  add_foreign_key "products", "lines"
  add_foreign_key "samplings", "products"
  add_foreign_key "weighings", "samplings"
end

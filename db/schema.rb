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

ActiveRecord::Schema.define(version: 2019_01_07_205706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "equipment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_id"], name: "index_assignments_on_equipment_id", unique: true
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name", null: false
    t.string "address"
    t.string "state"
    t.string "city"
    t.string "zip_code"
    t.string "phone_number"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.index ["email"], name: "index_brands_on_email", unique: true
    t.index ["name"], name: "index_brands_on_name", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "departments", force: :cascade do |t|
    t.string "name", null: false
    t.string "cost_center", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "cost_center"], name: "index_departments_on_name_and_cost_center", unique: true
  end

  create_table "equipment", force: :cascade do |t|
    t.bigint "brand_id", null: false
    t.bigint "model_id", null: false
    t.string "asset_tag", limit: 6
    t.string "hostname"
    t.string "serial_number"
    t.string "phone_number"
    t.string "sim_number", limit: 20
    t.string "imei", limit: 15
    t.string "device_number", limit: 15
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id", null: false
    t.index ["asset_tag"], name: "index_equipment_on_asset_tag"
    t.index ["brand_id"], name: "index_equipment_on_brand_id"
    t.index ["category_id"], name: "index_equipment_on_category_id"
    t.index ["device_number"], name: "index_equipment_on_device_number"
    t.index ["imei"], name: "index_equipment_on_imei"
    t.index ["model_id"], name: "index_equipment_on_model_id"
    t.index ["phone_number"], name: "index_equipment_on_phone_number"
    t.index ["serial_number"], name: "index_equipment_on_serial_number"
    t.index ["sim_number"], name: "index_equipment_on_sim_number"
  end

  create_table "job_titles", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_job_titles_on_name", unique: true
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "city", null: false
    t.string "state", limit: 2, null: false
    t.string "zip_code", limit: 10, null: false
    t.string "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_locations_on_name", unique: true
  end

  create_table "logs", force: :cascade do |t|
    t.string "processed_by", null: false
    t.string "past_user"
    t.string "past_record", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "models", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "release_date", null: false
    t.bigint "brand_id", null: false
    t.bigint "category_id", null: false
    t.string "processor"
    t.string "ram"
    t.string "storage_capacity"
    t.string "storage_type"
    t.string "display"
    t.string "battery_capacity"
    t.boolean "wifi"
    t.boolean "bluetooth"
    t.boolean "gps"
    t.string "cellular"
    t.string "camera"
    t.string "size"
    t.string "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "number"
    t.string "website"
    t.index ["brand_id"], name: "index_models_on_brand_id"
    t.index ["category_id"], name: "index_models_on_category_id"
    t.index ["name"], name: "index_models_on_name", unique: true
    t.index ["number"], name: "index_models_on_number"
    t.index ["release_date"], name: "index_models_on_release_date"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_statuses_on_name", unique: true
  end

  create_table "stocks", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.bigint "category_id"
    t.integer "total", default: 0, null: false
    t.integer "available", default: 0, null: false
    t.integer "in_use", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_stocks_on_category_id"
    t.index ["item_type", "item_id"], name: "index_stocks_on_item_type_and_item_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.bigint "location_id", null: false
    t.bigint "department_id", null: false
    t.string "phone_number"
    t.string "reports_to_type"
    t.bigint "reports_to_id"
    t.string "employee_number", limit: 7, null: false
    t.string "address"
    t.string "state", limit: 2
    t.string "city"
    t.string "zip_code", limit: 10
    t.bigint "job_title_id", null: false
    t.boolean "admin", default: false, null: false
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
    t.bigint "status_id"
    t.boolean "disable_login", default: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["employee_number"], name: "index_users_on_employee_number", unique: true
    t.index ["job_title_id"], name: "index_users_on_job_title_id"
    t.index ["location_id"], name: "index_users_on_location_id"
    t.index ["reports_to_type", "reports_to_id"], name: "index_users_on_reports_to_type_and_reports_to_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["status_id"], name: "index_users_on_status_id"
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end

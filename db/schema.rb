# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_28_172638) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "address"
    t.string "city"
    t.string "postal_zip"
    t.string "country"
    t.string "business_area"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "company_license_accounts", force: :cascade do |t|
    t.bigint "company_license_id", null: false
    t.bigint "employee_id", null: false
    t.boolean "active"
    t.string "access_permission"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_license_id"], name: "index_company_license_accounts_on_company_license_id"
    t.index ["employee_id"], name: "index_company_license_accounts_on_employee_id"
  end

  create_table "company_license_owners", force: :cascade do |t|
    t.bigint "company_license_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_license_id"], name: "index_company_license_owners_on_company_license_id"
    t.index ["user_id"], name: "index_company_license_owners_on_user_id"
  end

  create_table "company_licenses", force: :cascade do |t|
    t.bigint "plan_id", null: false
    t.bigint "sub_category_id", null: false
    t.bigint "company_id", null: false
    t.string "name"
    t.string "logo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_company_licenses_on_company_id"
    t.index ["plan_id"], name: "index_company_licenses_on_plan_id"
    t.index ["sub_category_id"], name: "index_company_licenses_on_sub_category_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employees", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "mobile"
    t.string "role"
    t.bigint "department_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_employees_on_company_id"
    t.index ["department_id"], name: "index_employees_on_department_id"
  end

  create_table "license_transactions", force: :cascade do |t|
    t.integer "total_purchase"
    t.datetime "purchase_date"
    t.bigint "company_license_id", null: false
    t.bigint "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_license_id"], name: "index_license_transactions_on_company_license_id"
    t.index ["owner_id"], name: "index_license_transactions_on_owner_id"
  end

  create_table "payment_transactions", force: :cascade do |t|
    t.bigint "system_account_id", null: false
    t.datetime "date"
    t.string "stripe_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["system_account_id"], name: "index_payment_transactions_on_system_account_id"
  end

  create_table "plans", force: :cascade do |t|
    t.bigint "vendor_id", null: false
    t.string "product_line"
    t.string "name"
    t.integer "price"
    t.integer "capacity"
    t.string "metric"
    t.text "description"
    t.string "billin_cycle"
    t.string "currency"
    t.text "cancellation_policy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vendor_id"], name: "index_plans_on_vendor_id"
  end

  create_table "sub_categories", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "name"
    t.string "icon"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id"
  end

  create_table "system_accounts", force: :cascade do |t|
    t.string "stripe_account"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.bigint "company_id", null: false
    t.bigint "department_id", null: false
    t.bigint "system_account_id", null: false
    t.string "role"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["system_account_id"], name: "index_users_on_system_account_id"
  end

  create_table "vendor_contacts", force: :cascade do |t|
    t.bigint "vendor_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "mobile"
    t.string "role"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vendor_id"], name: "index_vendor_contacts_on_vendor_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "address"
    t.string "city"
    t.string "postal_zip"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "company_license_accounts", "company_licenses"
  add_foreign_key "company_license_accounts", "employees"
  add_foreign_key "company_license_owners", "company_licenses"
  add_foreign_key "company_license_owners", "users"
  add_foreign_key "company_licenses", "companies"
  add_foreign_key "company_licenses", "plans"
  add_foreign_key "company_licenses", "sub_categories"
  add_foreign_key "employees", "companies"
  add_foreign_key "employees", "departments"
  add_foreign_key "license_transactions", "company_licenses"
  add_foreign_key "license_transactions", "users", column: "owner_id"
  add_foreign_key "payment_transactions", "system_accounts"
  add_foreign_key "plans", "vendors"
  add_foreign_key "sub_categories", "categories"
  add_foreign_key "users", "companies"
  add_foreign_key "users", "departments"
  add_foreign_key "users", "system_accounts"
  add_foreign_key "vendor_contacts", "vendors"
end

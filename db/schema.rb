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

ActiveRecord::Schema.define(version: 2018_06_02_094957) do

  create_table "beneficiaries", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "address"
    t.string "city"
    t.string "country"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.string "enterprise_name"
    t.index ["email"], name: "index_beneficiaries_on_email", unique: true
  end

  create_table "careers", force: :cascade do |t|
    t.string "job_title"
    t.string "department"
    t.text "posting"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "club_members", force: :cascade do |t|
    t.integer "investor_id"
    t.integer "club_id"
    t.integer "amount_invested"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "focus_country"
    t.string "country_manager"
    t.integer "fund_target"
    t.integer "amt_invested"
    t.integer "number_of_members"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "proposal"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "subject"
    t.text "inquiry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "role"
    t.string "email"
    t.string "job_category"
    t.string "job_location"
    t.string "reports_to"
    t.string "department"
    t.string "section"
    t.string "contact_number"
    t.string "employee_pid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "is_admin"
    t.string "avatar"
    t.string "employee_rank"
    t.index ["email"], name: "index_employees_on_email", unique: true
  end

  create_table "executors", force: :cascade do |t|
    t.string "primary_firstname"
    t.string "primary_lastname"
    t.integer "primary_phone_number"
    t.string "primary_email"
    t.string "primary_country_of_residence"
    t.string "secondary_firstname"
    t.string "secondary_lastname"
    t.integer "secondary_phone_number"
    t.string "secondary_email"
    t.string "secondary_country_of_residence"
    t.integer "investor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["investor_id"], name: "index_executors_on_investor_id"
  end

  create_table "investors", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.integer "investment_total"
    t.boolean "paid"
    t.integer "cust_id"
    t.index ["email"], name: "index_investors_on_email", unique: true
  end

  create_table "pages", force: :cascade do |t|
    t.string "caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.text "summary"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.index ["employee_id"], name: "index_posts_on_employee_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "investor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country"
    t.integer "target_amt"
    t.boolean "is_accepted"
    t.index ["investor_id"], name: "index_proposals_on_investor_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.text "bioSketch"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password_digest"
    t.integer "career_id"
    t.string "status"
    t.index ["career_id"], name: "index_resumes_on_career_id"
  end

end

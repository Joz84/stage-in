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

ActiveRecord::Schema.define(version: 20170923213129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "checkpoints", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order"
  end

  create_table "hiring_checkpoints", force: :cascade do |t|
    t.integer  "checkpoint_id"
    t.boolean  "checked"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "student_hiring_id"
    t.index ["checkpoint_id"], name: "index_hiring_checkpoints_on_checkpoint_id", using: :btree
    t.index ["student_hiring_id"], name: "index_hiring_checkpoints_on_student_hiring_id", using: :btree
  end

  create_table "hirings", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "internship_id"
    t.integer  "job_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["company_id"], name: "index_hirings_on_company_id", using: :btree
    t.index ["internship_id"], name: "index_hirings_on_internship_id", using: :btree
    t.index ["job_id"], name: "index_hirings_on_job_id", using: :btree
  end

  create_table "internships", force: :cascade do |t|
    t.string   "name"
    t.string   "level"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_skills", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "skill_id"
    t.float    "weight"
    t.float    "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_job_skills_on_job_id", using: :btree
    t.index ["skill_id"], name: "index_job_skills_on_skill_id", using: :btree
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_hirings", force: :cascade do |t|
    t.integer  "hiring_id"
    t.integer  "student_id"
    t.integer  "state",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["hiring_id"], name: "index_student_hirings_on_hiring_id", using: :btree
    t.index ["student_id"], name: "index_student_hirings_on_student_id", using: :btree
  end

  create_table "student_skills", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "skill_id"
    t.float    "weight"
    t.float    "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_student_skills_on_skill_id", using: :btree
    t.index ["student_id"], name: "index_student_skills_on_student_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "level"
    t.string   "address"
    t.string   "phone"
    t.float    "latitude"
    t.float    "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "hiring_checkpoints", "checkpoints"
  add_foreign_key "hiring_checkpoints", "student_hirings"
  add_foreign_key "hirings", "internships"
  add_foreign_key "hirings", "jobs"
  add_foreign_key "job_skills", "jobs"
  add_foreign_key "job_skills", "skills"
  add_foreign_key "student_hirings", "hirings"
  add_foreign_key "student_skills", "skills"
end

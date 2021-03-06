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

ActiveRecord::Schema.define(version: 2018_09_05_092307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.date "date_created"
    t.date "date_due"
    t.string "title"
    t.text "description"
    t.string "grading_type"
    t.integer "maximum_score"
    t.bigint "teaching_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "guardian_note"
    t.boolean "published", default: false
    t.boolean "marked"
    t.index ["teaching_group_id"], name: "index_assignments_on_teaching_group_id"
  end

  create_table "attempts", force: :cascade do |t|
    t.boolean "completed"
    t.integer "mark"
    t.text "comment"
    t.bigint "assignment_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignment_id"], name: "index_attempts_on_assignment_id"
    t.index ["student_id"], name: "index_attempts_on_student_id"
  end

  create_table "family_connections", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "guardian_id"
    t.integer "student_id"
    t.index ["guardian_id"], name: "index_family_connections_on_guardian_id"
    t.index ["student_id"], name: "index_family_connections_on_student_id"
  end

  create_table "student_group_memberships", force: :cascade do |t|
    t.bigint "student_teaching_group_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_group_memberships_on_student_id"
    t.index ["student_teaching_group_id"], name: "index_student_group_memberships_on_student_teaching_group_id"
  end

  create_table "teacher_group_memberships", force: :cascade do |t|
    t.bigint "teacher_teaching_group_id"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_teacher_group_memberships_on_teacher_id"
    t.index ["teacher_teaching_group_id"], name: "index_teacher_group_memberships_on_teacher_teaching_group_id"
  end

  create_table "teaching_groups", force: :cascade do |t|
    t.string "group_code"
    t.string "course"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "subject"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "course"
    t.boolean "teacher"
    t.boolean "guardian"
    t.boolean "student"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assignments", "teaching_groups"
  add_foreign_key "attempts", "assignments"
  add_foreign_key "attempts", "users", column: "student_id"
  add_foreign_key "family_connections", "users", column: "guardian_id"
  add_foreign_key "family_connections", "users", column: "student_id"
  add_foreign_key "student_group_memberships", "teaching_groups", column: "student_teaching_group_id"
  add_foreign_key "student_group_memberships", "users", column: "student_id"
  add_foreign_key "teacher_group_memberships", "teaching_groups", column: "teacher_teaching_group_id"
  add_foreign_key "teacher_group_memberships", "users", column: "teacher_id"
end

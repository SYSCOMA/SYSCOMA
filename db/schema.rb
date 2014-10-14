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

ActiveRecord::Schema.define(version: 20140831063044) do

  create_table "competencies_matrices", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_description"
    t.text     "description"
    t.boolean  "reference_matrix"
  end

  create_table "hierarchy_levels", force: true do |t|
    t.string   "name"
    t.integer  "below_level_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "jobs_id"
  end

  create_table "job_requirements", id: false, force: true do |t|
    t.integer "job_id"
    t.integer "requirement_id"
  end

  create_table "jobs", force: true do |t|
    t.string   "name"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "knowledge_areas", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "competencies_matrix_id"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sectors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "competencies_matrix_id"
  end

  create_table "team_project_relationships", id: false, force: true do |t|
    t.integer "team_id"
    t.integer "project_id"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "supervisor_id"
    t.integer  "superteam_id"
  end

  create_table "tickets", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "author_id"
    t.string   "author_type"
    t.string   "status"
    t.integer  "answer_id"
  end

  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id"

  create_table "user_competencies", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "competencies_matrix_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "job_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "values", force: true do |t|
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "skill_id"
    t.integer  "knowledge_area_id"
    t.integer  "competencies_matrix_id"
    t.integer  "values_set_id"
  end

  create_table "values_sets", force: true do |t|
    t.string   "name"
    t.integer  "value"
    t.integer  "competencies_matrix_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "values_sets", ["competencies_matrix_id"], name: "index_values_sets_on_competencies_matrix_id"

end

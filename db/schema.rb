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

ActiveRecord::Schema.define(version: 20141126185000) do

  create_table "abilities", force: true do |t|
    t.string   "name"
    t.integer  "competence_matrix_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "competence_matrices", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "competences", force: true do |t|
    t.integer  "user_id"
    t.integer  "knowledge_area_id"
    t.integer  "ability_id"
    t.integer  "value_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "criterion_id"
  end

  add_index "competences", ["ability_id"], name: "index_competences_on_ability_id"
  add_index "competences", ["criterion_id"], name: "index_competences_on_criterion_id"
  add_index "competences", ["knowledge_area_id"], name: "index_competences_on_knowledge_area_id"
  add_index "competences", ["user_id"], name: "index_competences_on_user_id"
  add_index "competences", ["value_id"], name: "index_competences_on_value_id"

  create_table "groups", force: true do |t|
    t.string   "name"
    t.integer  "subgroup_of_id"
    t.integer  "manager_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["manager_id"], name: "index_groups_on_manager_id"
  add_index "groups", ["subgroup_of_id"], name: "index_groups_on_subgroup_of_id"

  create_table "knowledge_areas", force: true do |t|
    t.string   "name"
    t.integer  "competence_matrix_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "knowledge_areas", ["competence_matrix_id"], name: "index_knowledge_areas_on_competence_matrix_id"

  create_table "search_criteria", force: true do |t|
    t.string   "name"
    t.text     "composition"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "scope_id"
    t.integer  "user_id"
  end

  add_index "search_criteria", ["user_id"], name: "index_search_criteria_on_user_id"

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
    t.string   "name"
    t.boolean  "admin"
    t.integer  "group_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["group_id"], name: "index_users_on_group_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "values", force: true do |t|
    t.string   "value"
    t.integer  "rank"
    t.integer  "competence_matrix_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ability_id"
  end

  add_index "values", ["ability_id"], name: "index_values_on_ability_id"
  add_index "values", ["competence_matrix_id"], name: "index_values_on_competence_matrix_id"

end

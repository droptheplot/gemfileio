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

ActiveRecord::Schema.define(version: 20151220143900) do

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.integer  "projects_count", default: 0, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.text     "body",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["project_id"], name: "index_comments_on_project_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "projects", force: :cascade do |t|
    t.string   "name",                               null: false
    t.string   "owner"
    t.string   "repo"
    t.text     "description"
    t.integer  "stars_count",        default: 0,     null: false
    t.integer  "forks_count",        default: 0,     null: false
    t.integer  "contributors_count", default: 0,     null: false
    t.integer  "views_count",        default: 0,     null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "category_id"
    t.integer  "downloads_count",    default: 0,     null: false
    t.boolean  "active",             default: false, null: false
    t.text     "readme"
  end

  add_index "projects", ["category_id"], name: "index_projects_on_category_id"

  create_table "users", force: :cascade do |t|
    t.string   "name",          null: false
    t.string   "email"
    t.string   "password_hash"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["provider"], name: "index_users_on_provider"
  add_index "users", ["uid"], name: "index_users_on_uid"

end

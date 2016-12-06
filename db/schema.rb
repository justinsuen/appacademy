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

ActiveRecord::Schema.define(version: 20161206174823) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cats", force: :cascade do |t|
    t.date     "birth_date"
    t.string   "color"
    t.string   "name"
    t.string   "sex",         limit: 1
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cats", ["color"], name: "index_cats_on_color", using: :btree
  add_index "cats", ["name"], name: "index_cats_on_name", using: :btree
  add_index "cats", ["sex"], name: "index_cats_on_sex", using: :btree

end

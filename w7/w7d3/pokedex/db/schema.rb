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

ActiveRecord::Schema.define(version: 20161010221951) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.integer  "pokemon_id", null: false
    t.string   "name",       null: false
    t.integer  "price",      null: false
    t.integer  "happiness",  null: false
    t.string   "image_url",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["pokemon_id"], name: "index_items_on_pokemon_id", using: :btree

  create_table "pokemons", force: :cascade do |t|
    t.string   "name",                    null: false
    t.integer  "attack",                  null: false
    t.integer  "defense",                 null: false
    t.string   "poke_type",               null: false
    t.string   "moves",      default: [], null: false, array: true
    t.string   "image_url",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pokemons", ["name"], name: "index_pokemons_on_name", unique: true, using: :btree

end

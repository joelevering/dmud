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

ActiveRecord::Schema.define(version: 20141223183556) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "character_classes", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "character_stats", force: true do |t|
    t.integer  "character_id"
    t.integer  "level"
    t.integer  "health"
    t.integer  "mana"
    t.integer  "attack"
    t.integer  "defense"
    t.integer  "dexterity"
    t.integer  "magic"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "character_stats", ["character_id"], name: "index_character_stats_on_character_id", using: :btree

  create_table "characters", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "race_id"
    t.integer  "class_id"
    t.integer  "stats_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "characters", ["class_id"], name: "index_characters_on_class_id", using: :btree
  add_index "characters", ["race_id"], name: "index_characters_on_race_id", using: :btree
  add_index "characters", ["stats_id"], name: "index_characters_on_stats_id", using: :btree

  create_table "items", force: true do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["owner_id", "owner_type"], name: "index_items_on_owner_id_and_owner_type", using: :btree

  create_table "races", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "room_exits", force: true do |t|
    t.integer  "origin_room_id"
    t.integer  "destination_room_id"
    t.string   "description"
    t.string   "trigger"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "room_exits", ["destination_room_id"], name: "index_room_exits_on_destination_room_id", using: :btree
  add_index "room_exits", ["origin_room_id"], name: "index_room_exits_on_origin_room_id", using: :btree

  create_table "rooms", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

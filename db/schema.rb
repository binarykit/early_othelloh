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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130423162101) do

  create_table "games", :force => true do |t|
    t.boolean  "turn",          :default => false
    t.boolean  "auto_opponent", :default => true
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "plays", :force => true do |t|
    t.integer  "game_id"
    t.integer  "tile_id"
    t.boolean  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tiles", :force => true do |t|
    t.integer  "row"
    t.integer  "col"
    t.boolean  "value"
    t.integer  "game_id"
    t.integer  "play_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end

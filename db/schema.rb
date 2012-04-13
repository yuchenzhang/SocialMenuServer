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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120411220627) do

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dish_pictures", :force => true do |t|
    t.integer  "dish_id"
    t.string   "caption"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "dishes", :force => true do |t|
    t.string   "name"
    t.integer  "restaurant_id"
    t.text     "description"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  create_table "ingredient_pictures", :force => true do |t|
    t.integer  "ingredient_id"
    t.string   "caption"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurant_pictures", :force => true do |t|
    t.integer  "restaurant_id"
    t.string   "caption"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "restaurants", :force => true do |t|
    t.string   "name"
    t.string   "uuid"
    t.decimal  "latitude",       :precision => 15, :scale => 10
    t.decimal  "longitude",      :precision => 15, :scale => 10
    t.integer  "city_id"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tables", :force => true do |t|
    t.integer  "restaurant_id"
    t.string   "uuid"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

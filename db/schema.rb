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

ActiveRecord::Schema.define(:version => 20120510090146) do

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "dishes", :force => true do |t|
    t.string   "name"
    t.integer  "restaurant_id"
    t.text     "description"
    t.float    "price"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "type"
  end

  create_table "dishes_orders", :id => false, :force => true do |t|
    t.integer "order_id"
    t.integer "dish_id"
  end

  add_index "dishes_orders", ["order_id", "dish_id"], :name => "index_dishes_orders_on_order_id_and_dish_id"

  create_table "orders", :force => true do |t|
    t.string   "status"
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "restaurant_pictures", :force => true do |t|
    t.integer  "restaurant_id"
    t.string   "caption"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "restaurants", :force => true do |t|
    t.string   "name"
    t.string   "uuid"
    t.decimal  "latitude",       :precision => 15, :scale => 10
    t.decimal  "longitude",      :precision => 15, :scale => 10
    t.integer  "city_id"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  create_table "reviews", :force => true do |t|
    t.integer  "user_id"
    t.integer  "dish_id"
    t.integer  "order_id"
    t.text     "comment"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "tables", :force => true do |t|
    t.integer  "restaurant_id"
    t.string   "uuid"
    t.integer  "number"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

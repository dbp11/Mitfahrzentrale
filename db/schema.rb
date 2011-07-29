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

ActiveRecord::Schema.define(:version => 20110729093446) do

  create_table "cars", :force => true do |t|
    t.integer  "user_id"
    t.integer  "seats"
    t.string   "trunk"
    t.string   "licence"
    t.float    "fuel_consumption"
    t.boolean  "smoker"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
  end

  add_index "cars", ["user_id"], :name => "index_cars_on_user_id"

  create_table "ignore", :id => false, :force => true do |t|
    t.integer "ignoring_id"
    t.integer "ignored_id"
  end

  create_table "messages", :force => true do |t|
    t.text     "message"
    t.integer  "writer_id"
    t.integer  "receiver_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["receiver_id"], :name => "index_messages_on_receiver_id"
  add_index "messages", ["writer_id"], :name => "index_messages_on_writer_id"

  create_table "passengers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "trip_id"
    t.boolean  "confirmed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "passengers", ["trip_id"], :name => "index_passengers_on_trip_id"
  add_index "passengers", ["user_id"], :name => "index_passengers_on_user_id"

  create_table "ratings", :force => true do |t|
    t.string   "comment"
    t.integer  "mark"
    t.integer  "trip_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "receiver_id"
    t.integer  "author_id"
  end

  add_index "ratings", ["trip_id"], :name => "index_ratings_on_trip_id"

  create_table "requests", :force => true do |t|
    t.float    "starts_at_N"
    t.float    "starts_at_E"
    t.float    "ends_at_N"
    t.float    "ends_at_E"
    t.string   "address_start"
    t.string   "address_end"
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean  "baggage"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "trips", :force => true do |t|
    t.integer  "user_id"
    t.integer  "car_id"
    t.float    "starts_at_N"
    t.float    "starts_at_E"
    t.float    "ends_at_E"
    t.float    "ends_at_N"
    t.string   "address_start"
    t.string   "address_end"
    t.datetime "start_time"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "baggage"
  end

  add_index "trips", ["car_id"], :name => "index_trips_on_car_id"
  add_index "trips", ["user_id"], :name => "index_trips_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "user_type"
    t.boolean  "sex"
    t.string   "address"
    t.float    "addressN"
    t.float    "addressE"
    t.integer  "zipcode"
    t.integer  "phone"
    t.string   "instantmessenger"
    t.string   "city"
    t.boolean  "email_notifications"
    t.boolean  "visible_phone"
    t.boolean  "visible_email"
    t.boolean  "visible_address"
    t.boolean  "visible_age"
    t.boolean  "visible_im"
    t.boolean  "visible_cars"
    t.date     "birthday"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

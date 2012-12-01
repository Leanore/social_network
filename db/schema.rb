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

ActiveRecord::Schema.define(:version => 20121130113842) do

  create_table "avatars", :force => true do |t|
    t.integer  "information_id"
    t.integer  "photo_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "cities", :force => true do |t|
    t.integer  "country_id"
    t.string   "title",      :limit => 50
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.text     "content"
    t.date     "posted_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "countries", :force => true do |t|
    t.string   "title",               :limit => 50
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "iso_two_letter_code", :limit => 2
  end

  create_table "information", :force => true do |t|
    t.integer  "user_id"
    t.integer  "country_id"
    t.integer  "city_id"
    t.date     "date_of_birth"
    t.string   "gender",        :limit => 1
    t.text     "about"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "messages", :force => true do |t|
    t.text     "content"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "title"
  end

  create_table "photo_albums", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "photos", :force => true do |t|
    t.text     "content"
    t.date     "posted_date"
    t.string   "url"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "photo_album_id"
  end

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.text     "content"
    t.date     "posted_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name",                                   :null => false
    t.string   "surname",                                :null => false
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

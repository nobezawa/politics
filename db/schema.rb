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

ActiveRecord::Schema.define(:version => 20140209055741) do

  create_table "answers", :force => true do |t|
    t.integer  "question_id",                   :null => false
    t.integer  "answer_content", :limit => 255, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "maching_id"
  end

  create_table "machings", :force => true do |t|
    t.text     "cookie_id",      :null => false
    t.integer  "gender",         :null => false
    t.integer  "age",            :null => false
    t.integer  "electoral_zone", :null => false
    t.string   "policy1"
    t.string   "policy2"
    t.string   "policy3"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "access_token"
  end

  add_index "machings", ["access_token"], :name => "index_machings_on_access_token", :unique => true

  create_table "parties", :force => true do |t|
    t.integer  "party_id"
    t.string   "party_name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "party_img"
    t.text     "description"
  end

  create_table "party_answers", :id => false, :force => true do |t|
    t.integer "party_id"
    t.integer "question_id"
    t.integer "answer_content"
  end

  create_table "questions", :force => true do |t|
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "question_content"
    t.integer  "question_id"
    t.text     "question_description"
    t.string   "question_img"
  end

end

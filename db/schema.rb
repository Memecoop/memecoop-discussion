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

ActiveRecord::Schema.define(:version => 20111102074123) do

  create_table "edges", :force => true do |t|
    t.integer  "source_id"
    t.integer  "sink_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category",   :default => "related"
  end

  add_index "edges", ["sink_id"], :name => "index_edges_on_sink_id"
  add_index "edges", ["source_id", "sink_id"], :name => "index_edges_on_source_id_and_sink_id", :unique => true
  add_index "edges", ["source_id"], :name => "index_edges_on_source_id"

  create_table "nodes", :force => true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "category"
    t.integer  "creator_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                 :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "facebook_session_key"
    t.integer  "facebook_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "roles"
  end

end

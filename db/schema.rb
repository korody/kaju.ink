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

ActiveRecord::Schema.define(:version => 20130130005533) do

  create_table "attachments", :force => true do |t|
    t.text     "description"
    t.string   "image"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "attachments", ["attachable_id"], :name => "index_attachments_on_attachable_id"

  create_table "jobs", :force => true do |t|
    t.string   "client"
    t.string   "client_info"
    t.string   "spot"
    t.string   "title"
    t.string   "what"
    t.string   "area"
    t.string   "duration"
    t.string   "material"
    t.text     "description"
    t.string   "type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "messages", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "works", :force => true do |t|
    t.string   "type"
    t.integer  "job_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end

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

ActiveRecord::Schema.define(version: 20140826031804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"
  enable_extension "pg_trgm"

  create_table "attachments", force: true do |t|
    t.text     "description"
    t.string   "image"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachments", ["attachable_id"], name: "index_attachments_on_attachable_id", using: :btree

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clippings", force: true do |t|
    t.string   "title"
    t.string   "link"
    t.string   "type"
    t.string   "video"
    t.string   "description"
    t.string   "website"
    t.string   "date"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.string   "client_info"
    t.string   "spot"
    t.string   "title"
    t.string   "what"
    t.string   "area"
    t.string   "duration"
    t.string   "material"
    t.string   "video"
    t.string   "website"
    t.text     "description"
    t.string   "type"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "title"
    t.string   "link"
    t.integer  "marketable_id"
    t.string   "marketable_type"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["marketable_id"], name: "index_products_on_marketable_id", using: :btree

  create_table "thumbnails", force: true do |t|
    t.string   "thumb"
    t.integer  "thumbable_id"
    t.string   "thumbable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "thumbnails", ["thumbable_id"], name: "index_thumbnails_on_thumbable_id", using: :btree

end

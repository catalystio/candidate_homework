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

ActiveRecord::Schema.define(version: 2021_07_27_194308) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "connections", force: :cascade do |t|
    t.bigint "integration_id", null: false
    t.string "username", null: false
    t.string "password", null: false
    t.string "host", null: false
    t.string "database", null: false
    t.string "table", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["integration_id"], name: "index_connections_on_integration_id"
    t.index ["username"], name: "index_connections_on_username"
  end

  create_table "field_mappings", force: :cascade do |t|
    t.bigint "connection_id", null: false
    t.string "local_field"
    t.string "external_field"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["connection_id"], name: "index_field_mappings_on_connection_id"
    t.index ["external_field"], name: "index_field_mappings_on_external_field"
    t.index ["local_field"], name: "index_field_mappings_on_local_field"
  end

  create_table "integrations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

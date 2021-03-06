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

ActiveRecord::Schema.define(version: 2021_03_06_152827) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auths", force: :cascade do |t|
    t.string "username", null: false
    t.string "password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username", "password"], name: "index_auths_on_username_and_password", unique: true
  end

  create_table "connections", force: :cascade do |t|
    t.bigint "integration_id"
    t.bigint "auth_id"
    t.string "host", null: false
    t.string "database", null: false
    t.string "table", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auth_id"], name: "index_connections_on_auth_id"
    t.index ["integration_id"], name: "index_connections_on_integration_id"
  end

  create_table "integrations", force: :cascade do |t|
    t.string "name"
    t.jsonb "config", default: {}, comment: "Arbitrary JSON that the FE will parse to generate layout data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "connections", "auths"
  add_foreign_key "connections", "integrations", on_delete: :cascade
end

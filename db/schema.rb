# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_29_153348) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "excavators", force: :cascade do |t|
    t.bigint "ticket_id"
    t.string "company_name", null: false
    t.jsonb "address", default: {}, null: false
    t.boolean "crew_on_site", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ticket_id"], name: "index_excavators_on_ticket_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "request_number", null: false
    t.string "request_type", null: false
    t.string "sequence_number", null: false
    t.datetime "response_due_date_time_at", null: false
    t.string "primary_sa_code"
    t.string "additional_sa_codes", default: [], array: true
    t.geometry "digsite_info", limit: {:srid=>0, :type=>"st_polygon"}, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "excavators", "tickets"
end

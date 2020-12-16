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

ActiveRecord::Schema.define(version: 2020_12_16_044050) do

  create_table "coffees", force: :cascade do |t|
    t.string "name"
    t.integer "roast_id", null: false
    t.datetime "roasted_on"
    t.integer "grind_id", null: false
    t.integer "tasting_notes_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["grind_id"], name: "index_coffees_on_grind_id"
    t.index ["roast_id"], name: "index_coffees_on_roast_id"
    t.index ["tasting_notes_id"], name: "index_coffees_on_tasting_notes_id"
  end

  create_table "grinds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roasts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tasting_notes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "coffees", "grinds"
  add_foreign_key "coffees", "roasts"
  add_foreign_key "coffees", "tasting_notes", column: "tasting_notes_id"
end

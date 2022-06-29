# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_29_015954) do
  create_table "albums", force: :cascade do |t|
    t.integer "users_id", null: false
    t.string "tiltle"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_albums_on_users_id"
  end

  create_table "photos", force: :cascade do |t|
    t.integer "users_id", null: false
    t.integer "albums_id", null: false
    t.string "tiltle"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["albums_id"], name: "index_photos_on_albums_id"
    t.index ["users_id"], name: "index_photos_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "email"
    t.text "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "albums", "users", column: "users_id"
  add_foreign_key "photos", "albums", column: "albums_id"
  add_foreign_key "photos", "users", column: "users_id"
end

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

ActiveRecord::Schema[7.0].define(version: 2022_06_30_080340) do
  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_albums_on_user_id"
  end

  create_table "follow_users", primary_key: ["follower_id", "followed_id"], force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_follow_users_on_followed_id"
    t.index ["follower_id"], name: "index_follow_users_on_follower_id"
  end

  create_table "like_posts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "album_id", null: false
    t.integer "photo_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_like_posts_on_album_id"
    t.index ["photo_id"], name: "index_like_posts_on_photo_id"
    t.index ["user_id"], name: "index_like_posts_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "album_id"
    t.index ["album_id"], name: "index_photos_on_album_id"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "email"
    t.text "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admin"
  end

  add_foreign_key "albums", "users"
  add_foreign_key "follow_users", "users", column: "followed_id"
  add_foreign_key "follow_users", "users", column: "follower_id"
  add_foreign_key "like_posts", "albums"
  add_foreign_key "like_posts", "photos"
  add_foreign_key "like_posts", "users"
  add_foreign_key "photos", "albums"
  add_foreign_key "photos", "users"
end

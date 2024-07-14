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

ActiveRecord::Schema[7.1].define(version: 2024_07_13_120312) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0, null: false
    t.bigint "user_id"
    t.index ["status"], name: "index_games_on_status"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "tries", force: :cascade do |t|
    t.string "result"
    t.integer "quantity"
    t.integer "place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "game_id", null: false
    t.integer "position", default: 1, null: false
    t.index ["game_id", "position"], name: "index_tries_on_game_id_and_position", unique: true
    t.index ["game_id"], name: "index_tries_on_game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_token_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "games", "users"
  add_foreign_key "tries", "games"
end

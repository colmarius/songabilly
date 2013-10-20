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

ActiveRecord::Schema.define(version: 20131019222953) do

  create_table "artists", force: true do |t|
    t.string   "name"
    t.string   "echonest_artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: true do |t|
    t.integer  "genre_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["genre_id"], name: "index_games_on_genre_id", using: :btree

  create_table "genres", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quizzes", force: true do |t|
    t.text     "options"
    t.integer  "game_id"
    t.text     "right_answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quizzes", ["game_id"], name: "index_quizzes_on_game_id", using: :btree

  create_table "tracks", force: true do |t|
    t.string   "name"
    t.integer  "artist_id"
    t.integer  "genre_id"
    t.string   "echonest_track_id"
    t.string   "title"
    t.string   "audio_clip_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tracks", ["artist_id"], name: "index_tracks_on_artist_id", using: :btree
  add_index "tracks", ["genre_id"], name: "index_tracks_on_genre_id", using: :btree

end

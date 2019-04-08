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

ActiveRecord::Schema.define(version: 2019_04_06_125341) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fixtures", force: :cascade do |t|
    t.date "fixture_date"
    t.integer "match_day"
    t.integer "home_team_score"
    t.integer "away_team_score"
    t.bigint "home_team_id"
    t.bigint "away_team_id"
    t.bigint "pitch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["away_team_id"], name: "index_fixtures_on_away_team_id"
    t.index ["home_team_id"], name: "index_fixtures_on_home_team_id"
    t.index ["pitch_id"], name: "index_fixtures_on_pitch_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.bigint "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_leagues_on_season_id"
  end

  create_table "pitches", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "postal_code"
    t.string "city"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_game_stats", force: :cascade do |t|
    t.integer "goals_for"
    t.integer "goals_against"
    t.integer "assists"
    t.integer "yellow_cards"
    t.integer "red_cards"
    t.bigint "fixture_id"
    t.bigint "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fixture_id"], name: "index_player_game_stats_on_fixture_id"
    t.index ["player_id"], name: "index_player_game_stats_on_player_id"
  end

  create_table "player_season_stats", force: :cascade do |t|
    t.integer "games_played"
    t.integer "goals_for"
    t.integer "goals_against"
    t.integer "assists"
    t.integer "yellow_cards"
    t.integer "red_cards"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "photo"
    t.string "position"
    t.string "jersey_number"
    t.bigint "team_id"
    t.bigint "user_id"
    t.bigint "player_season_stats_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_season_stats_id"], name: "index_players_on_player_season_stats_id"
    t.index ["team_id"], name: "index_players_on_team_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "season_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_season_stats", force: :cascade do |t|
    t.integer "games_played"
    t.integer "wins"
    t.integer "draws"
    t.integer "defeats"
    t.integer "goals_for"
    t.integer "goals_against"
    t.integer "yellow_cards"
    t.integer "red_cards"
    t.string "moment_shape"
    t.bigint "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_team_season_stats_on_league_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.string "logo"
    t.bigint "team_season_stats_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_season_stats_id"], name: "index_teams_on_team_season_stats_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "birthdate"
    t.string "email"
    t.string "phone"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "fixtures", "pitches"
  add_foreign_key "leagues", "seasons"
  add_foreign_key "player_game_stats", "fixtures"
  add_foreign_key "player_game_stats", "players"
  add_foreign_key "players", "player_season_stats", column: "player_season_stats_id"
  add_foreign_key "players", "teams"
  add_foreign_key "players", "users"
  add_foreign_key "team_season_stats", "leagues"
  add_foreign_key "teams", "team_season_stats", column: "team_season_stats_id"
end

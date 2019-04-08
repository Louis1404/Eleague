class Player < ApplicationRecord
  belongs_to :team
  belongs_to :user
  belongs_to :player_game_stat
  belongs_to :player_season_stat
end

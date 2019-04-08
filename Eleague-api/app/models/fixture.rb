class Fixture < ApplicationRecord
  belongs_to :home_team, :class_name => :team, :foreign_key => `home_team`
  belongs_to :away_team, :class_name => :team, :foreign_key => `away_team`
  belongs_to :pitch
  has_many :player_game_stats
end

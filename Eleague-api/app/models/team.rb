class Team < ApplicationRecord
  belongs_to :team_season_stats
  has_many :players
  has_many :fixtures
end

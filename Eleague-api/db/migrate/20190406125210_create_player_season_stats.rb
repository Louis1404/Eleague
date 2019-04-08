class CreatePlayerSeasonStats < ActiveRecord::Migration[5.2]
  def change
    create_table :player_season_stats do |t|
      t.integer :games_played
      t.integer :goals_for
      t.integer :goals_against
      t.integer :assists
      t.integer :yellow_cards
      t.integer :red_cards

      t.timestamps
    end
  end
end

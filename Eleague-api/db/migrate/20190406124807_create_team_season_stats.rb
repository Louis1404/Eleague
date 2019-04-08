class CreateTeamSeasonStats < ActiveRecord::Migration[5.2]
  def change
    create_table :team_season_stats do |t|
      t.integer :games_played
      t.integer :wins
      t.integer :draws
      t.integer :defeats
      t.integer :goals_for
      t.integer :goals_against
      t.integer :yellow_cards
      t.integer :red_cards
      t.string :moment_shape
      t.references :league, foreign_key: true

      t.timestamps
    end
  end
end

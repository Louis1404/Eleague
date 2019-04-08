class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :photo
      t.string :position
      t.string :jersey_number
      t.references :team, foreign_key: true
      t.references :user, foreign_key: true
      t.references :player_season_stats, foreign_key: true

      t.timestamps
    end
  end
end

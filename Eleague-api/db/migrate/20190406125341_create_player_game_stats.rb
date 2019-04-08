class CreatePlayerGameStats < ActiveRecord::Migration[5.2]
  def change
    create_table :player_game_stats do |t|
      t.integer :goals_for
      t.integer :goals_against
      t.integer :assists
      t.integer :yellow_cards
      t.integer :red_cards
      t.references :fixture, foreign_key: true
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end

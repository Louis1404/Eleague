class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :photo
      t.string :logo
      t.references :team_season_stats, foreign_key: true

      t.timestamps
    end
  end
end

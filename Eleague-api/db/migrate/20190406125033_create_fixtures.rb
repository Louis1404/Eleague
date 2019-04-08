class CreateFixtures < ActiveRecord::Migration[5.2]
  def change
    create_table :fixtures do |t|
      t.date :fixture_date
      t.integer :match_day
      t.integer :home_team_score
      t.integer :away_team_score
      t.references :home_team
      t.references :away_team
      t.references :pitch, foreign_key: true

      t.timestamps
    end
  end
end

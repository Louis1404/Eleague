class CreatePitches < ActiveRecord::Migration[5.2]
  def change
    create_table :pitches do |t|
      t.string :name
      t.string :address
      t.string :postal_code
      t.string :city
      t.string :photo

      t.timestamps
    end
  end
end

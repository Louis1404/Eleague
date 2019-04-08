class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :birthdate
      t.string :email
      t.string :phone
      t.boolean :admin

      t.timestamps
    end
  end
end

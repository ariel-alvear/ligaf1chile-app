class CreateLeagues < ActiveRecord::Migration[6.1]
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :description
      t.integer :participants
      t.integer :admins

      t.timestamps
    end
  end
end

class CreateSanctions < ActiveRecord::Migration[6.1]
  def change
    create_table :sanctions do |t|
      t.text :description
      t.integer :points_taken
      t.string :videolink
      t.references :user_event, null: false, foreign_key: true

      t.timestamps
    end
  end
end

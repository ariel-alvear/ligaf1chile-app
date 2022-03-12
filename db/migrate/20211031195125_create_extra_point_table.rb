class CreateExtraPointTable < ActiveRecord::Migration[6.1]
  def change
    create_table :extra_points do |t|
      t.text :description
      t.integer :points_given
      t.references :user_event, null: false, foreign_key: true

      t.timestamps
    end
  end
end

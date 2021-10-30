class CreatePositionsTables < ActiveRecord::Migration[6.1]
  def change
    create_table :positions_tables do |t|
      t.string :position
      t.integer :points
      t.references :points_system, null: false, foreign_key: true

      t.timestamps
    end
  end
end

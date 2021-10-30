class CreatePointsSystems < ActiveRecord::Migration[6.1]
  def change
    create_table :points_systems do |t|
      t.string :name

      t.timestamps
    end
  end
end

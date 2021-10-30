class CreateLeaguePointsSystems < ActiveRecord::Migration[6.1]
  def change
    create_table :league_points_systems do |t|
      t.references :league, null: false, foreign_key: true
      t.references :points_system, null: false, foreign_key: true

      t.timestamps
    end
  end
end

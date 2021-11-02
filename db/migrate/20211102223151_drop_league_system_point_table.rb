class DropLeagueSystemPointTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :league_points_systems
  end
end

class AddPointsToUserLeague < ActiveRecord::Migration[6.1]
  def change
    add_column :user_leagues, :points, :integer
  end
end

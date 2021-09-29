class RemoveLeaguesColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :leagues, :participants
    remove_column :leagues, :admins
  end
end

class AddStatusToUserLeague < ActiveRecord::Migration[6.1]
  def change
    add_column :user_leagues, :status, :integer, default: 0
  end
end

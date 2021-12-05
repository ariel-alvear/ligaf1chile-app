class AddStatusToUserEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :user_events, :status, :integer, default: 0
  end
end

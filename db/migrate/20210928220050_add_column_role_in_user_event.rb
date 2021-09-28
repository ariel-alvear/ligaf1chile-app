class AddColumnRoleInUserEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :user_events, :role, :string
  end
end

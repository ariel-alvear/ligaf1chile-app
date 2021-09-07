class AddAttributesToUserModel < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :drivers_name, :string
  end
end

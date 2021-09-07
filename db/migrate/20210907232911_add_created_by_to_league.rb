class AddCreatedByToLeague < ActiveRecord::Migration[6.1]
  def change
    add_column :leagues, :created_by, :string
  end
end

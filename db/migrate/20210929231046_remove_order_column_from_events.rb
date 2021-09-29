class RemoveOrderColumnFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :order
  end
end

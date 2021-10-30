class Addindextouserevent < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_index :user_events, [:user_id, :event_id], unique: true, algorithm: :concurrently
  end
end

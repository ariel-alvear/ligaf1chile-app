class Addindextouserleague < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_index :user_leagues, [:user_id, :league_id], unique: true, algorithm: :concurrently
  end
end

class AddForeignKeysToLeagueLikes < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_reference :league_likes, :user, index: {algorithm: :concurrently}
    add_reference :league_likes, :league, index: {algorithm: :concurrently}
  end
end

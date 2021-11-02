class AddPointsSystemToLeague < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_reference :leagues, :points_system, null: false, index: {algorithm: :concurrently}
  end
end

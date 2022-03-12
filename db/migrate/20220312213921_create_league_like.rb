class CreateLeagueLike < ActiveRecord::Migration[6.1]
  def change
    create_table :league_likes do |t|
      t.timestamps
    end
  end
end

class AddUniqueIndexToTries < ActiveRecord::Migration[7.1]
  def change
    add_index :tries, [:game_id, :position], unique: true
  end
end

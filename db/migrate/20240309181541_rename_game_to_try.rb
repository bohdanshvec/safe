class RenameGameToTry < ActiveRecord::Migration[7.1]
  def change
    rename_table :games, :tries
  end
end

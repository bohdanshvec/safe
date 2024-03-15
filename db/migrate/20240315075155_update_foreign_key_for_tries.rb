class UpdateForeignKeyForTries < ActiveRecord::Migration[7.1]
  def change
    add_column :tries, :game_id, :bigint
    change_column_null :tries, :game_id, false
    add_foreign_key :tries, :games, column: :game_id
    remove_foreign_key :tries, column: :code_id
    remove_index :tries, name: "index_tries_on_code_id"
    remove_column :tries, :code_id
    add_index :tries, :game_id
  end
end

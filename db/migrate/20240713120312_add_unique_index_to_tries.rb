# frozen_string_literal: true

class AddUniqueIndexToTries < ActiveRecord::Migration[7.1]
  def change
    add_index :tries, %i[game_id position], unique: true
  end
end

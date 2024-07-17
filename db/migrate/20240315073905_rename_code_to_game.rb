# frozen_string_literal: true

class RenameCodeToGame < ActiveRecord::Migration[7.1]
  def change
    rename_table :codes, :games
  end
end

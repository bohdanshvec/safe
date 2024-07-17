# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :result
      t.integer :quantity
      t.integer :place

      t.timestamps
    end
  end
end

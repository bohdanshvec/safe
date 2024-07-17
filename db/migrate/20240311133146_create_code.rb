# frozen_string_literal: true

class CreateCode < ActiveRecord::Migration[7.1]
  def change
    create_table :codes do |t|
      t.string :code

      t.timestamps
    end
  end
end

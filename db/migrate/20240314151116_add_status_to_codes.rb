# frozen_string_literal: true

class AddStatusToCodes < ActiveRecord::Migration[7.1]
  def change
    add_column :codes, :status, :integer, default: 0, null: false
    add_index :codes, :status
  end
end

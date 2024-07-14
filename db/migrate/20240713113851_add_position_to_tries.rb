class AddPositionToTries < ActiveRecord::Migration[7.1]
  def change
    add_column :tries, :position, :integer, null: false, default: 1
  end
end

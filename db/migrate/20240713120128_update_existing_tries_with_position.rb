# frozen_string_literal: true

class UpdateExistingTriesWithPosition < ActiveRecord::Migration[7.1]
  def up
    Game.find_each do |game|
      game.tries.order(:created_at).each_with_index do |try, index|
        try.update_columns(position: index + 1)
      end
    end
  end

  def down
    Game.find_each do |game|
      game.tries.update_all(position: 1)
    end
  end
end

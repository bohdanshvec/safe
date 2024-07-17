# frozen_string_literal: true

class CreateTries < ActiveRecord::Migration[7.1]
  def change
    add_reference :tries, :code, null: false, foreign_key: true
  end
end

class Game < ApplicationRecord
  validates :result, presence: true, format: { with: /[0-9]/,
    message: "only numbers" }, length: { maximum: 4 }
end

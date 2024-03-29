class Game < ApplicationRecord
  enum status: { in_progress: 0, completed: 1 }
  has_many :tries
  belongs_to :user, optional: true
end
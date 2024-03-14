class Code < ApplicationRecord
  enum status: { not_over: 0, over: 1 }
  has_many :tries
end
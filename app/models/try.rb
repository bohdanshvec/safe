class Try < ApplicationRecord
  belongs_to :code

  validates :result, presence: true, format: { with: /\A\d{4,}\z/, message: "only numbers" }, length: { is: 4 }

  validate :unique_digits

  validates :result, uniqueness: { scope: :code_id, message: 'You have already entered this result' }

  private

  def unique_digits
    if result.present? && result.to_s.chars.uniq.length != result.to_s.length
      errors.add(:result, "Digits must be unique")
    end
  end
end

# frozen_string_literal: true

class Try < ApplicationRecord
  belongs_to :game
  positioned on: :game

  validates :result, presence: true # , format: { with: /\A\d{4,}\z/, message: I18n.t('global.errors.only_numbers') }

  validates :result, length: { is: 4 }

  validate :format_result

  validate :unique_digits

  validates :result, uniqueness: { scope: :game_id, message: I18n.t('global.errors.entered') }

  private

  def format_result
    return if result =~ /\A\d{4,}\z/

    errors.add(:result, I18n.t('global.errors.only_numbers'))
  end

  def unique_digits
    return unless result.present? && result.to_s.chars.uniq.length != result.to_s.length

    errors.add(:result, I18n.t('global.errors.digits_unique'))
  end
end

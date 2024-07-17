# frozen_string_literal: true

module Treatment
  extend ActiveSupport::Concern

  # rubocop:disable Metrics/BlockLength
  included do
    private

    def change_status_code
      @code.status = 1
      @code.save
      session.delete(:current_game_id)
    end

    def calculate_quantity(result)
      code = @code.code.gsub(/[\s,]/, '')
      index = 0
      quantity = 0

      while index < 4
        quantity += 1 if code.include?(result[index])
        index += 1
      end

      quantity
    end

    def calculate_place(result)
      code = @code.code.gsub(/[\s,]/, '')
      reconciliation_index = 0
      place = 0

      while reconciliation_index < 4
        place += 1 if code[reconciliation_index] == result[reconciliation_index]
        reconciliation_index += 1
      end

      place
    end
  end
  # rubocop:enable Metrics/BlockLength
end

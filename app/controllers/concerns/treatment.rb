module Treatment
  extend ActiveSupport::Concern

  # rubocop:disable Metrics/BlockLength
  included do

    private

    def calculate_quantity(result)

      code = session[:combination].gsub(/[\s,]/, '')
      index = 0
      quantity = 0
  
      while index < 4
        if code.include?(result[index])
          quantity +=1
        end
        index += 1
      end
  
      quantity
    end
  
    def calculate_place(result)
      code = session[:combination].gsub(/[\s,]/, '')
      reconciliation_index = 0
      place = 0
  
      while reconciliation_index < 4
        if code[reconciliation_index] == result[reconciliation_index]
          place +=1
        end
          reconciliation_index +=1
      end
  
      place
  
    end
  end
  # rubocop:enable Metrics/BlockLength
end
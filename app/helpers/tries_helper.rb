module TriesHelper
  def try_text(try)
    "#{ try.result } - #{ t('global.text.you_guessed') } #{ try.quantity } " +  (try.quantity == 1 ? "#{t('global.text.number')}" : "#{t('global.text.numbers')}") + " #{ t('global.text.of_them') } #{ try.place } " + (try.place == 1 ? "#{t('global.text.in_its_place')}" : "#{t('global.text.in_their_places')}")
  end

  def victory_text(try_vikrory)
    if [1, 21, 31].include?(try_vikrory)
      "#{ t('global.viktory.you_needed_1') } #{ try_vikrory } #{ t('global.viktory.attempt_1') }!"
    elsif [2, 3, 4, 22, 23, 24, 32, 33,34].include?(try_vikrory)
      "#{ t('global.viktory.you_needed_2') } #{ try_vikrory } #{ t('global.viktory.attempt_2') }!"
    else
      "#{ t('global.viktory.you_needed_2') } #{ try_vikrory } #{ t('global.viktory.attempt_10') }!"
    end
  end
end
module TriesHelper
  def try_text(try)
    "#{ try.result } ви вгадали #{ try.quantity } #{ try.quantity == 1 ? 'цифру' : 'цифри' } з них #{ try.place } #{ try.place == 1 ? 'на своєму місці' : 'на своїх місцях'}"
  end

  def victory_text(try_vikrory)
    if [1, 21, 31].include?(try_vikrory)
      "Вам знадобилася #{ try_vikrory } cпроба!"
    elsif [2, 3, 4, 22, 23, 24, 32, 33,34].include?(try_vikrory)
      "Вам знадобилося #{ try_vikrory } cпроби!"
    else
      "Вам знадобилося #{ try_vikrory } cпроб!"
    end
  end
end
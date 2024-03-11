module TriesHelper
  def try_text(try)
    "#{ try.result } ви вгадали #{ try.quantity } #{ try.quantity == 1 ? 'цифру' : 'цифри' } з них #{ try.place } #{ try.place == 1 ? 'на своєму місці' : 'на своїх місцях'}"
  end

  def victory_text
    if [1, 21, 31].include?(Try.count)
      "Вам знадобилася #{ Try.count } cпроба!"
    elsif [2, 3, 4, 22, 23, 24, 32, 33,34].include?(Try.count)
      "Вам знадобилося #{ Try.count } cпроби!"
    else
      "Вам знадобилося #{ Try.count } cпроб!"
    end
  end
end
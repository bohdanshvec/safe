module GamesHelper
  def try_text(game)
    "#{ game.result } ви вгадали #{ game.quantity } #{ game.quantity == 1 ? 'цифру' : 'цифри' } з них #{ game.place } #{ game.place == 1 ? 'на своєму місці' : 'на своїх місцях'}"
  end

  def victory_text
    if [1, 21, 31].include?(Game.count)
      "Вам знадобилася #{ Game.count } cпроба!"
    elsif [2, 3, 4, 22, 23, 24, 32, 33,34].include?(Game.count)
      "Вам знадобилося #{ Game.count } cпроби!"
    else
      "Вам знадобилося #{ Game.count } cпроб!"
    end
  end
end
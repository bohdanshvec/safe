class GamesController < ApplicationController
  include Treatment
  
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    
    # Обработка result и установка quantity и place
    process_result(@game.result)

    if @game.save
      respond_to do |format|
        format.html do
          # flash[:success] = 'Ваш ответ принят'
          redirect_to root_path
        end

        format.turbo_stream do
          # flash.now[:success] = 'Ваш ответ принят'
        end
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def start_game
    # Очистить куки
    cookies.delete(:code)

    # Очистить таблицу Game
    Game.delete_all

    # Создать новую комбинацию и сохранить в куки
    combination = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"].shuffle.pop(4)
    cookies[:code] = combination.join(", ")

    redirect_to root_path
  end

  private

  def game_params
    params.require(:game).permit(:result)
  end

  def process_result(result)
    @game.quantity = calculate_quantity(result)
    @game.place = calculate_place(result)
  end


end
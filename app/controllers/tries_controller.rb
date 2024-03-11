class TriesController < ApplicationController
  include Treatment
  
  def index
    @tries = Try.all
  end

  def new
    @try = Try.new
  end

  def create
    @try = Try.new(try_params)

    if @try.save
          
      # Обработка result и установка quantity и place
      process_result(@try.result)

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
    # Очистить таблицу Game
    Try.delete_all

    # Создать новую комбинацию и сохранить в сессию
    @combination = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"].shuffle.pop(4).join(", ")
    session[:combination] = @combination
    redirect_to root_path
  end

  private

  def try_params
    params.require(:try).permit(:result)
  end

  def process_result(result)
    @try.quantity = calculate_quantity(result)
    @try.place = calculate_place(result)
  end

end
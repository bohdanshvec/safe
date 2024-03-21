class TriesController < ApplicationController
  include Treatment

  def index
    @tries = Try.where(game_id: current_code.id) if current_code.present?
  end

  def new
    @try = Try.new
  end

  def create
    @code = current_code
    @try = @code.tries.new(try_params)

    if @try.save

      @try.quantity = calculate_quantity(@try.result)
      @try.place = calculate_place(@try.result)
      change_status_code if @try.place == 4

      if @try.save

        respond_to do |format|
          format.html do
            # flash[:success] = 'Ваш ответ принят'
            redirect_to root_path
          end

          format.turbo_stream do
            # flash.now[:success] = 'Ваш ответ принят'
          end
        end
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def start_game
    code_game = (0..9).to_a.shuffle.pop(4).join(", ")

    current_user.present? ? @game = current_user.games.create(code: code_game) : @game = Game.create(code: code_game)
    
    current_session_game(@game)
    # session[:current_code] = @code.id
    redirect_to root_path
  end

  private

  def try_params
    params.require(:try).permit(:result)
  end

end
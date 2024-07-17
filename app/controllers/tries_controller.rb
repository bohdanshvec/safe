# frozen_string_literal: true

class TriesController < ApplicationController
  include Treatment

  def index
    current_session_game(params[:game_id]) if params[:game_id].present?
    @tries = current_game.tries.order(position: :asc) if current_game.present?
  end

  def new
    @try = current_game.tries.build
    @try.position = current_game.tries.count + 1
  end

  def create
    @code = current_game
    @try = @code.tries.build(try_params)

    if @try.save

      @try.quantity = calculate_quantity(@try.result)
      @try.place = calculate_place(@try.result)
      change_status_code if @try.place == 4
      session.delete(:current_game_id) if Try.where(game_id: @code).count >= 30

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
    code_game = (0..9).to_a.shuffle.pop(4).join(', ')

    @game = current_user.present? ? current_user.games.create(code: code_game) : Game.create(code: code_game)

    current_session_game(@game.id)
    redirect_to root_path
  end

  def reorder
    @try = current_game.tries.find_by(position: params[:old_position])
    new_position = params[:new_position].to_i

    if @try.update(position: new_position)
      head :ok
    else
      head :unprocessable_entity
    end
  end

  private

  def try_params
    params.require(:try).permit(:result, :position)
  end
end

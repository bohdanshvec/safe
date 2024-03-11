class TriesController < ApplicationController
  include Treatment

  def index
    @tries = Try.where(code_id: Code.last)
    @code_show = Code.last.code
  end

  def new
    @try = Try.new
  end

  def create
    @code = Code.last
    @try = @code.tries.new(try_params)

    # Обработка result и установка quantity и place
    # @try.quantity = calculate_quantity(@try.result)
    # @try.place = calculate_place(@try.result)

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
    else
      render :new, status: :unprocessable_entity
    end
  end

  def start_game
    @code = Code.new(code:(0..9).to_a.shuffle.pop(4).join(", "))
    @code.save
    session[:combination] = true

    redirect_to root_path
  end

  private

  def try_params
    params[:try][:quantity] = calculate_quantity(params[:try][:result])
    params[:try][:place] = calculate_place(params[:try][:result])
    params.require(:try).permit(:result, :quantity, :place)
  end

end
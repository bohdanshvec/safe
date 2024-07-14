class UsersController < ApplicationController
  before_action :require_no_authentication, only: %i[new create]
  before_action :require_authentication, only: %i[edit update unfinished_games finished_games]
  before_action :set_user!, only: %i[edit update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      session.delete(:current_game_id)
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def unfinished_games
    calculation_user_statistics(current_user.games)
    @games_unfinished = current_user.games.where(status: 0).order updated_at: :desc
  end

  def finished_games
    if params.present?
      case
        
      end
      end
    end
    calculation_user_statistics(current_user.games)
    @games_finished = current_user.games.where(status: 1).order updated_at: :desc
  end

  def finished_games
    if params.present?
      @games_finished = current_user.games.where(status: 1)
  
      case
      when params[:all_games] == '1'
        # Если выбраны все игры, ничего не фильтруем
      when params[:less_5_tries] == '1'
        @games_finished = @games_finished.where('tries < ?', 5)
      when params[:tries_6_7] == '1'
        @games_finished = @games_finished.where(tries: 6..7)
      when params[:tries_8_10] == '1'
        @games_finished = @games_finished.where(tries: 8..10)
      when params[:more_10_tries] == '1'
        @games_finished = @games_finished.where('tries > ?', 10)
      else
        # Если ни один из параметров не установлен, вернуть все игры
        @games_finished = current_user.games.where(status: 1)
      end
  
      @games_finished = @games_finished.order(updated_at: :desc)
    else
      @games_finished = current_user.games.where(status: 1).order(updated_at: :desc)
    end
  
    calculation_user_statistics(current_user.games)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = t('.success')
      redirect_to edit_user_path
    else      
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user!
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :old_password)
  end


  def calculation_user_statistics(games)
    @all_games = games.count
    @finished_games = games.where(status: 1).count
    @unfinished_games = games.where(status: 0).count
    @up_to_5_tries_games = games.where(status: 1).select { |game| game.tries.ids.count <= 5}.count
    @to_6_7_tries_games = games.where(status: 1).select { |game| game.tries.count.between?(6, 7) }.count
    @to_8_10_tries_games = games.where(status: 1).select { |game| game.tries.count.between?(8, 10) }.count
    @more_than_10_tries_games = games.where(status: 1).select { |game| game.tries.ids.count > 10 }.count
  end
end
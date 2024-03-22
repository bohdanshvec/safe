class UsersController < ApplicationController
  before_action :require_no_authentication, only: %i[new create]
  before_action :require_authentication, only: %i[edit update unfinished_games finished_games]
  before_action :set_user!, only: %i[edit update]
  before_action :calculation__statistics, only: %i[finished_games unfinished_games]

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
    @games_unfinished = current_user.games.where(status: 0)
  end

  def finished_games
    @games_finished = current_user.games.where(status: 1)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'Your profile was successfully updated!'
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

  def calculation__statistics
    @games_all = current_user.games
    calculation_user_statistics(@games_all)
  end
end
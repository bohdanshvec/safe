# frozen_string_literal: true

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

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = t('.success')
      redirect_to edit_user_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def unfinished_games
    statistics_processing(0)
  end

  def finished_games
    statistics_processing(1)
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
    @finished_games = games.where(status: 1)
    @unfinished_games = games.where(status: 0)
    @up_to_5_tries_games = @finished_games.select { |game| game.tries.ids.count <= 5 }.count
    @to_6_7_tries_games = @finished_games.select { |game| game.tries.count.between?(6, 7) }.count
    @to_8_10_tries_games = @finished_games.select { |game| game.tries.count.between?(8, 10) }.count
    @more_than_10_tries_games = @finished_games.select { |game| game.tries.ids.count > 10 }.count
  end

  def statistics_processing(status)
    calculation_user_statistics(current_user.games)

    if params.present?
      @opacity = 'opacity-100'
      @games_un_or_finished = current_user.games.where(status: status)

      case params[:filter]
        when 'all_games_opasity'
          @all_games_opasity = 'opacity-50'
        when 'less_5_tries'
          @games_un_or_finished = @games_un_or_finished.select { |game| game.tries.ids.count <= 5 }
          @less_5_tries = 'opacity-50'
        when 'tries_6_7'
          @games_un_or_finished = @games_un_or_finished.select { |game| game.tries.count.between?(6, 7) }
          @tries_6_7 = 'opacity-50'
        when 'tries_8_10'
          @games_un_or_finished = @games_un_or_finished.select { |game| game.tries.count.between?(8, 10) }
          @tries_8_10 = 'opacity-50'
        when 'more_10_tries'
          @games_un_or_finished = @games_un_or_finished.select { |game| game.tries.ids.count > 10 }
          @more_10_tries = 'opacity-50'
        else
          @games_un_or_finished = current_user.games.where(status: status)
          @all_games_opasity = 'opacity-50'
      end

    else
      @games_un_or_finished = current_user.games.where(status: status).order(updated_at: :desc)
    end
  end
end

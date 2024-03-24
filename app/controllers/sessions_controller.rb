class SessionsController < ApplicationController
  before_action :require_no_authentication, only: %i[new create]
  before_action :require_authentication, only: :destroy

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      sign_in(user)
      remember(user) if params[:remember_me] == '1'
      session.delete(:current_game_id)
      redirect_to root_path
    else
      flash.now[:warning] = t('.warning')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    forget(current_user)
    sing_out
    redirect_to root_path
  end
end
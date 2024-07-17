# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Authentication
  include CurrentGame
  include Internationalization

  before_action :calculation_finished_unfinished_games, if: -> { current_user.present? }

  def calculation_finished_unfinished_games
    @finished_games_count = current_user.games.where(status: 1).count
    @unfinished_games_count = current_user.games.where(status: 0).count
  end
end

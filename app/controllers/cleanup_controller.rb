class CleanupController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :verify_secret_key

  def run
    CleanupJob.perform_now
    render plain: 'Cleanup job executed'
  end

  private

  def verify_secret_key
    head :forbidden unless params[:secret] == ENV['SECRET_KEY']
  end
end
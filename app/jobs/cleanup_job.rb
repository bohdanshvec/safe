class CleanupJob < ApplicationJob
  queue_as :default

  def perform
    Game.where(user_id: nil).where('updated_at < ?', 1.day.ago).destroy_all
  end
end
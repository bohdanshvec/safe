class User < ApplicationRecord
  has_many :games
  
  attr_accessor :old_password

  has_secure_password validations: false

  validate :password_presence
  validate :correct_old_password, on: :update
  validates :password, confirmation: true, allow_blank: true, length: { minimum: 4 }
  
  validates :email, presence: true, uniqueness: true, 'valid_email_2/email': true
  validates :name, presence: true

  private

  def correct_old_password
    return if BCrypt::Password.new(password_digest_was).is_password?(old_password)

    errors.add :old_password, 'is incorrect'
  end

  def password_presence
    errors.add(:password, :blank) unless password_digest.present?
  end
end

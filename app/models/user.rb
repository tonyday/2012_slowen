class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password
  before_save :create_remember_token

  validates :name, presence: true
  valid_email_regex = /(^([^@\s]+)@((?:[-_a-z0-9]+\.)+[a-z]{2,})$)|(^$)/i
  validates :email,
            presence: true,
            format: { with: valid_email_regex },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end

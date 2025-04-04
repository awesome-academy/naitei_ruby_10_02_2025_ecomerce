class User < ApplicationRecord
  has_secure_password

  has_many :orders, dependent: :destroy
  has_one :cart, dependent: :destroy

  validates :email, presence: true, uniqueness: true,
                    length: {maximum: Settings.email.max_length},
                    format: {with: Regexp.new(Settings.email.email_regex)}
  validates :username, presence: true,
                       length: {minimum: Settings.password.min_length}

  class << self
    def new_token
      SecureRandom.urlsafe_base64
    end

    def digest string
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create string, cost:
    end
  end
  attr_accessor :remember_token

  def remember
    self.remember_token = User.new_token
    update_column :remember_digest, User.digest(remember_token)
  end

  def forget
    update_column :remember_digest, nil
  end

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false unless digest

    BCrypt::Password.new(digest).is_password? token
  end
end

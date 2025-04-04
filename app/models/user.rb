class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_one :cart, dependent: :destroy

  validates :email, presence: true, uniqueness: true,
                    length: {maximum: Settings.email.max_length},
                    format: {with: Regexp.new(Settings.email.email_regex)}
  validates :username, presence: true,
                       length: {minimum: Settings.password.min_length}
end

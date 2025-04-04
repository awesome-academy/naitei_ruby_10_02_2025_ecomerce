class Category < ApplicationRecord
  has_many :product_categories, dependent: :destroy
  has_many :products, through: :product_categories

  validates :name, presence: true, uniqueness: true,
            length: {minimum: Settings.default.digit_3,
                     maximum: Settings.default.digit_100}
end

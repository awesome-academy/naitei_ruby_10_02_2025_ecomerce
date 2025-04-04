class Product < ApplicationRecord
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories

  validates :name, presence: true,
            length: {minimum: Settings.default.digit_3,
                     maximum: Settings.default.digit_100}
  validates :price, presence: true,
            numericality: {greater_than: Settings.default.digit_0,
                           less_than_or_equal_to: Settings.price.max}
  validates :stock_quantity, presence: true,
            numericality: {only_integer: true,
                           greater_than_or_equal_to: Settings.default.digit_0}
end

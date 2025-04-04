class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true,
            numericality: {only_integer: true,
                           greater_than: Settings.default.digit_0}
  validates :price, presence: true,
            numericality: {greater_than_or_equal_to: Settings.default.digit_0}
end

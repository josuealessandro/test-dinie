class Customer < ApplicationRecord
  validates :customer_name, presence: true, length: { maximum: 255 }
  validates :first_payment_delay, numericality: { only_integer: true }, allow_nil: true
  validates :payment_day, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 31 }, allow_nil: true
end

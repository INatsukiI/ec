class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { wait_payment: 0, confirm_payment: 1, now_product: 2, ship_preparation: 3, shipped: 4 }
end

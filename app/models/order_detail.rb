class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum production_status: { no_product: 0, wait_product: 1, now_product: 2, comp_product: 3 }
end

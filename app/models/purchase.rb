class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :order
  has_one :customer, through: :order

  def total
    item.price * quantity
  end
end

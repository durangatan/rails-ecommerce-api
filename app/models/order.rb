class Order < ApplicationRecord
  belongs_to :customer
  has_many :purchases, dependent: :destroy

  def item_total
    purchases.map(&:total).reduce(:+)
  end
end

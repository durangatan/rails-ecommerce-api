class Item < ApplicationRecord
  has_many :purchases
  has_many :orders, through: :purchases
  has_many :customers, through: :orders
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :images, as: :imageable


  def self.all_with_category_ids
    response = []
    self.all.each do |item|
      attrs = item.attributes
      attrs[:category_ids] = item.categories.map(&:id)
      response << attrs
    end
    response
  end
end

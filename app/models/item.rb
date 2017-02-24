class Item < ApplicationRecord
  has_many :purchases
  has_many :orders, through: :purchases
  has_many :customers, through: :orders
  has_many :categorizations
  has_many :categories, through: :categorizations
end

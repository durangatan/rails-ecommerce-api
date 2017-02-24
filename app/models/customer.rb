class Customer < ApplicationRecord
  has_many :dwellings, dependent: :destroy
  has_many :postal_addresses, through: :dwellings
  has_many :orders
  has_many :purchases, through: :orders
  has_many :purchased_items, through: :purchases, source: :item

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
end

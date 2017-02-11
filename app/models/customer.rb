class Customer < ApplicationRecord
    has_many :dwellings
    has_many :postal_addresses, through: :dwellings
    has_many :purchases
    has_many :orders, through: :purchases
    has_many :purchased_items, through: :purchases, class_name: item

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

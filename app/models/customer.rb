class Customer < ApplicationRecord
  has_secure_password
  has_many :dwellings, dependent: :destroy
  has_many :postal_addresses, through: :dwellings
  has_many :orders
  has_many :purchases, through: :orders
  has_many :purchased_items, through: :purchases, source: :item

  before_create :generate_auth_token

  def generate_auth_token
    loop do
      self.auth_token = SecureRandom.base64(64)
      break unless Customer.find_by(auth_token: auth_token)
    end
  end
end

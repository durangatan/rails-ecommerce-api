class PostalAddress < ApplicationRecord
  has_many :dwellings, foreign_key: :address_id, dependent: :destroy
  has_many :residents, through: :dwellings, source: :customer
end

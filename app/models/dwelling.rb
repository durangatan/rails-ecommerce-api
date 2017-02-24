class Dwelling < ApplicationRecord
  belongs_to :customer
  belongs_to :postal_address, foreign_key: "address_id"
end

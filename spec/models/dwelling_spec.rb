require 'rails_helper'

RSpec.describe Dwelling, type: :model do

  it {should belong_to(:customer)}
  it {should belong_to(:postal_address)}
end

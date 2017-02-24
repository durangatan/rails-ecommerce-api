require 'rails_helper'

RSpec.describe PostalAddress, type: :model do

  it{should have_many(:dwellings).dependent(:destroy)}
  it{should have_many(:residents).through(:dwellings).source(:customer)}

end

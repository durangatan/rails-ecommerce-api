require 'rails_helper'

RSpec.describe Purchase, type: :model do

  before do
    @purchase = create(:purchase)
  end


  it{should belong_to(:item)}
  it{should belong_to(:order)}
  it{should have_one(:customer).through(:order)}

  it("calculates its total price") do
    expect(@purchase.total).to eq 12
  end
end

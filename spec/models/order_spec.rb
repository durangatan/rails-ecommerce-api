require 'rails_helper'

RSpec.describe Order, type: :model do

  before do
    @order = create(:order_with_purchases)
  end
  it {should belong_to(:customer)}
  it {should have_many(:purchases).dependent(:destroy)}

  it "knows its item total" do
    expect(@order.item_total).to eq 12
  end

end

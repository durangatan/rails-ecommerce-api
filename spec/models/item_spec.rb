require 'rails_helper'


RSpec.describe Item, type: :model do

  it { should have_many(:purchases) }
  it { should have_many(:orders).through(:purchases)}
  it { should have_many(:customers).through(:orders)}
  it { should have_many(:categorizations)}
  it { should have_many(:categories).through(:categorizations)}
end

require 'rails_helper'

RSpec.describe Category, type: :model do
  it{should have_many(:categorizations)}
  it{should have_many(:items).through(:categorizations)}
end

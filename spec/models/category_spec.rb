require 'rails_helper'

RSpec.describe Category, type: :model do
  let!(:parent){Category.create(name:"Parent")}
  let!(:categories){ create_list(:category, 10, parent_id:parent.id)}

  it{should have_many(:categorizations)}
  it{should have_many(:items).through(:categorizations)}

  it "knows which categories are parent categories" do
    expect(!Category.parent_categories.map(&:parent_id).any?)
  end

  it "creates a nested structure of its own taxonomy" do
    expect(Category.all_nested[0][:child_categories].length).to be > 0
  end

end

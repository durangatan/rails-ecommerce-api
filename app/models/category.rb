class Category < ApplicationRecord
  has_many :categorizations
  has_many :items, through: :categorizations
  has_many :child, class_name: "Category", foreign_key: :parent_id
  belongs_to :parent, class_name: "Category", foreign_key: :parent_id, optional: true


  def self.parent_categories
    Category.where(parent_id:nil)
  end

  def self.all_nested
    nested = []
    self.parent_categories.each do |c|
      nested.push(
        {
          id: c.id,
          name:c.name,
          thumbnail: c.thumbnail,
          child_categories:Category.where(parent_id:c)
      })
    end
    nested
  end

end

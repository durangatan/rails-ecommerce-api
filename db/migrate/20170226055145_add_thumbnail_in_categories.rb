class AddThumbnailInCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :thumbnail, :string
  end
end

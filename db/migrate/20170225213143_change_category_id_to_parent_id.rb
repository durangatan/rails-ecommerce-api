class ChangeCategoryIdToParentId < ActiveRecord::Migration[5.0]
  def change
    rename_column :categories, :category_id, :parent_id
  end
end

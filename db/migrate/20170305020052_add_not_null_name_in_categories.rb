class AddNotNullNameInCategories < ActiveRecord::Migration[5.0]
  def change
    change_column_null :categories, :name, false

  end
end

class AddThumbnailInItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :thumbnail, :string
  end
end

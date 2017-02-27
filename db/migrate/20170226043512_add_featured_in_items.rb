class AddFeaturedInItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :featured, :boolean, default: :false
  end
end

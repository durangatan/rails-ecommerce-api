class AddUniqueIndexOnPurchases < ActiveRecord::Migration[5.0]
  def change
    add_index :purchases, [:item_id, :order_id], unique: true
  end
end

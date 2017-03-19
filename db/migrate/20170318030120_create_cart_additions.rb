class CreateCartAdditions < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_additions do |t|
      t.boolean :active, null:false, default:true
      t.integer :item_id, null:false
      t.integer :customer_id, null:false
      t.integer :quantity
      t.timestamps
    end
  end
end

class CreateDwellings < ActiveRecord::Migration[5.0]
  def change
    create_table :dwellings do |t|
      t.integer :customer_id
      t.integer :address_id
      t.timestamps
    end
  end
end

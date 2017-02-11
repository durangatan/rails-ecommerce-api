class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.string :availability
      t.boolean :unique, null:false

      t.timestamps
    end
  end
end

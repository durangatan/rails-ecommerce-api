class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :url
      t.string :imageable_id, null:false
      t.string :imageable_type, null:false
      t.timestamps
    end
  end
end

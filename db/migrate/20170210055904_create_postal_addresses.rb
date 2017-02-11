class CreatePostalAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :postal_addresses do |t|
      t.string :street
      t.string :city
      t.string :subdivision
      t.string :postal_code
      t.string :country_code
      t.string :time_zone, default: "UTC"
      t.timestamps
    end
  end
end

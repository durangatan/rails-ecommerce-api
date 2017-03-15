class AddAuthTokenInCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :auth_token, :string, unique: true
  end
end

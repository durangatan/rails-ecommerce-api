class AddIsAdminInCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :admin, :boolean, null: false, default: false
  end
end

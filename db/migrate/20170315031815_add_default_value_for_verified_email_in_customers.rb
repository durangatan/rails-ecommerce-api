class AddDefaultValueForVerifiedEmailInCustomers < ActiveRecord::Migration[5.0]
  def change
    change_column_default :customers, :verified_email, false
  end
end

class AddCustIdToInvestors < ActiveRecord::Migration[5.2]
  def change
    add_column :investors, :cust_id, :integer
  end
end

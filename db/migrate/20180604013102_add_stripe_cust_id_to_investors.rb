class AddStripeCustIdToInvestors < ActiveRecord::Migration[5.2]
  def change
    add_column :investors, :stripe_cust_id, :string
  end
end

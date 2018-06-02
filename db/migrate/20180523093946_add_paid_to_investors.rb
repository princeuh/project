class AddPaidToInvestors < ActiveRecord::Migration[5.2]
  def change
    add_column :investors, :paid, :boolean
  end
end

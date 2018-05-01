class AddInvestmentTotalToInvestors < ActiveRecord::Migration[5.1]
  def change
    add_column :investors, :investment_total, :integer
  end
end

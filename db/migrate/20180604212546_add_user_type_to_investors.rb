class AddUserTypeToInvestors < ActiveRecord::Migration[5.2]
  def change
    add_column :investors, :user_type, :string
  end
end

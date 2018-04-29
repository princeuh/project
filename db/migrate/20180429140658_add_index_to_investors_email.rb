class AddIndexToInvestorsEmail < ActiveRecord::Migration[5.1]
  def change
  	add_index :investors, :email, unique: true
  end
end

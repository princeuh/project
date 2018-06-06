class AddActivationInvestors < ActiveRecord::Migration[5.2]
  def change
  	add_column :investors, :activation_digest, :string
    add_column :investors, :activated, :boolean, default: false
    add_column :investors, :activated_at, :datetime
  end
end

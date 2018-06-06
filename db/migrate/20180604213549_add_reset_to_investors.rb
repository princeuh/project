class AddResetToInvestors < ActiveRecord::Migration[5.2]
  def change
    add_column :investors, :reset_digest, :string
    add_column :investors, :reset_send_at, :datetime
  end
end

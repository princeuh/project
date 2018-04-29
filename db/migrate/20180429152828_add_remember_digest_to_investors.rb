class AddRememberDigestToInvestors < ActiveRecord::Migration[5.1]
  def change
    add_column :investors, :remember_digest, :string
  end
end

class AddRememberDigestToBeneficiaries < ActiveRecord::Migration[5.1]
  def change
    add_column :beneficiaries, :remember_digest, :string
  end
end

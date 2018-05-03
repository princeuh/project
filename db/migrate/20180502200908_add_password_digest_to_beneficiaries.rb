class AddPasswordDigestToBeneficiaries < ActiveRecord::Migration[5.1]
  def change
    add_column :beneficiaries, :password_digest, :string
  end
end

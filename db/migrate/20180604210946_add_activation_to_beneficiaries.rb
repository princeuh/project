class AddActivationToBeneficiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :beneficiaries, :activation_digest, :string
    add_column :beneficiaries, :activated, :boolean, default: false
    add_column :beneficiaries, :activated_at, :datetime
  end
end

class AddResetToBeneficiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :beneficiaries, :reset_digest, :string
    add_column :beneficiaries, :reset_send_at, :datetime
  end
end

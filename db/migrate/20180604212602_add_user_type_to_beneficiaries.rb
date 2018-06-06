class AddUserTypeToBeneficiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :beneficiaries, :user_type, :string
  end
end

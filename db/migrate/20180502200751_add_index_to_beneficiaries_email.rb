class AddIndexToBeneficiariesEmail < ActiveRecord::Migration[5.1]
  def change
  	 add_index :beneficiaries, :email, unique: true
  end
end

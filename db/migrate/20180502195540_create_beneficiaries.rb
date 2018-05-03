class CreateBeneficiaries < ActiveRecord::Migration[5.1]
  def change
    create_table :beneficiaries do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :address
      t.string :city
      t.string :country
      t.string :phone_number

      t.timestamps
    end
  end
end

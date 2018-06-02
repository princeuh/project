class AddEnterpriseNameToBeneficiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :beneficiaries, :enterprise_name, :string
  end
end

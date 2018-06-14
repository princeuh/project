class CreateBeneficiaryProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :beneficiary_projects do |t|
      t.string :title
      t.text :introduction
      t.text :description
      t.text :company_description
      t.text :enterprise_particulars
      t.text :marketing
      t.text :human_resources
      t.text :collateral_fund
      t.text :management
      t.text :project_financing
      t.text :financial_analysis
      t.text :economic_analysis
      t.text :social_implications
      t.text :environmental_implications
      t.text :transport_impacts
      t.text :conclusion
      t.references :beneficiary, foreign_key: true

      t.timestamps
    end
  end
end

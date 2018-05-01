class AddCountryToProposals < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :country, :string
  end
end

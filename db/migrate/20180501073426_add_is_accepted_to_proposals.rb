class AddIsAcceptedToProposals < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :is_accepted, :boolean
  end
end

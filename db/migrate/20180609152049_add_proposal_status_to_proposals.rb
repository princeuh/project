class AddProposalStatusToProposals < ActiveRecord::Migration[5.2]
  def change
    add_column :proposals, :proposal_status, :string
  end
end

class AddProposalToClubs < ActiveRecord::Migration[5.1]
  def change
    add_column :clubs, :proposal, :text
  end
end

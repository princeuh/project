class AddTargetAmtToProposals < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :target_amt, :integer
  end
end

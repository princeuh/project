class AddIsApprovedToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :is_approved, :boolean
  end
end

class CreateClubMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :club_members do |t|
      t.integer :investor_id
      t.integer :club_id
      t.integer :amount_invested

      t.timestamps
    end
     add_index :club_members, [:investor_id, :created_at]
  end
end

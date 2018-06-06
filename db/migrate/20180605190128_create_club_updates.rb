class CreateClubUpdates < ActiveRecord::Migration[5.2]
  def change
    create_table :club_updates do |t|
      t.string :title
      t.text :content
      t.string :subtitle
      t.string :picture

      t.timestamps
    end
  end
end

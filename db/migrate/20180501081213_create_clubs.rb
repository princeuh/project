class CreateClubs < ActiveRecord::Migration[5.1]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :focus_country
      t.string :country_manager
      t.integer :fund_target
      t.integer :amt_invested
      t.integer :number_of_members

      t.timestamps
    end
  end
end



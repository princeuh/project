class CreateExecutors < ActiveRecord::Migration[5.1]
  def change
    create_table :executors do |t|
      t.string :primary_firstname
      t.string :primary_lastname
      t.integer :primary_phone_number
      t.string :primary_email
      t.string :primary_country_of_residence
      t.string :secondary_firstname
      t.string :secondary_lastname
      t.integer :secondary_phone_number
      t.string :secondary_email
      t.string :secondary_country_of_residence
      t.references :investor, foreign_key: true

      t.timestamps
    end
  end
end


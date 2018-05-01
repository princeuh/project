class CreateProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :proposals do |t|
      t.string :title
      t.text :content
      t.references :investor, foreign_key: true

      t.timestamps
    end
  end
end

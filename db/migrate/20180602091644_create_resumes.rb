class CreateResumes < ActiveRecord::Migration[5.2]
  def change
    create_table :resumes do |t|
      t.string :firstname
      t.string :lastname
      t.text :bioSketch
      t.string :attachment

      t.timestamps
    end
  end
end

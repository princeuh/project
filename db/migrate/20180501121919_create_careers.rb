class CreateCareers < ActiveRecord::Migration[5.1]
  def change
    create_table :careers do |t|
      t.string :job_title
      t.string :department
      t.text :posting

      t.timestamps
    end
  end
end

class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :firstname
      t.string :lastname
      t.string :role
      t.string :email
      t.string :job_category
      t.string :job_location
      t.string :reports_to
      t.string :department
      t.string :section
      t.string :contact_number
      t.string :employee_pid

      t.timestamps
    end
  end
end

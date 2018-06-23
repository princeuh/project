class CreateEmployeeCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_calendars do |t|
      t.integer :day
      t.string :month
      t.string :year
      t.string :objective
      t.string :author

      t.timestamps
    end
  end
end

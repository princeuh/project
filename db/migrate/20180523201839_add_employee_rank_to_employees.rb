class AddEmployeeRankToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :employee_rank, :string
  end
end

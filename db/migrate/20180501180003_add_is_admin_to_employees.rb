class AddIsAdminToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :is_admin, :boolean
  end
end

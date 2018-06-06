class AddUserTypeToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :user_type, :string
  end
end

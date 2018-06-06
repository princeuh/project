class AddUserTypeToResumes < ActiveRecord::Migration[5.2]
  def change
    add_column :resumes, :user_type, :string
  end
end

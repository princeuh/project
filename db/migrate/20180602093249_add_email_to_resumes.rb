class AddEmailToResumes < ActiveRecord::Migration[5.2]
  def change
    add_column :resumes, :email, :string
  end
end

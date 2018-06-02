class AddStatusToResumes < ActiveRecord::Migration[5.2]
  def change
    add_column :resumes, :status, :string
  end
end

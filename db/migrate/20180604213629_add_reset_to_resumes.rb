class AddResetToResumes < ActiveRecord::Migration[5.2]
  def change
    add_column :resumes, :reset_digest, :string
    add_column :resumes, :reset_send_at, :datetime
  end
end
